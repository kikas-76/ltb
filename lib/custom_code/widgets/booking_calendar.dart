// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({
    super.key,
    this.width,
    this.height,
    required this.listingRef,
  });

  final double? width;
  final double? height;
  final DocumentReference listingRef;

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  PickerDateRange? _selectedRange;
  late Stream<List<BookingsRecord>> _stream;
  final DateRangePickerController _controller = DateRangePickerController();
  static const int _maxDays = 7;

  @override
  void initState() {
    super.initState();

    _stream = queryBookingsRecord(
      queryBuilder: (q) => q.where('listing_ref', isEqualTo: widget.listingRef),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _writeToAppState(null, null);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  List<DateTime> _buildBlockedDates(List<BookingsRecord> bookings) {
    final blocked = <DateTime>{};
    for (final b in bookings) {
      final start = b.startDate;
      final end = b.endDate;
      if (start == null) continue;
      final s = _dateOnly(start);
      final e = _dateOnly(end ?? start);
      final from = s.isBefore(e) ? s : e;
      final to = s.isBefore(e) ? e : s;
      var cur = from;
      while (!cur.isAfter(to)) {
        blocked.add(cur);
        cur = cur.add(const Duration(days: 1));
      }
    }
    return blocked.toList()..sort();
  }

  void _writeToAppState(DateTime? start, DateTime? end) {
    final defaultDate = DateTime(2000, 1, 1);
    final s = start == null ? defaultDate : _dateOnly(start);
    final e = end == null ? s : _dateOnly(end);

    FFAppState().update(() {
      FFAppState().tempStartDate = s;
      FFAppState().tempEndDate = e;
    });

    if (mounted) setState(() {});
  }

  void _showMaxDaysSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'La durée maximale de location est de $_maxDays jours',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return StreamBuilder<List<BookingsRecord>>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            width: widget.width,
            height: widget.height ?? 380,
            decoration: BoxDecoration(
              color: theme.secondaryBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.alternate),
            ),
            child: Center(
              child: Text(
                'Erreur de chargement',
                style: theme.bodyMedium,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Container(
            width: widget.width,
            height: widget.height ?? 380,
            decoration: BoxDecoration(
              color: theme.secondaryBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.alternate),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: theme.primary,
              ),
            ),
          );
        }

        final bookings = snapshot.data!;
        final blockedDates = _buildBlockedDates(bookings);

        return Container(
          width: widget.width,
          height: widget.height ?? 380,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.secondaryBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.alternate),
          ),
          child: SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            showNavigationArrow: true,
            enablePastDates: false,
            minDate: DateTime.now(),
            monthViewSettings: DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              showTrailingAndLeadingDates: true,
              blackoutDates: blockedDates,
            ),
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: theme.titleMedium,
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: theme.bodyMedium,
              todayTextStyle: theme.bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
              ),
              blackoutDateTextStyle: theme.bodyMedium.copyWith(
                color: theme.secondaryText,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            rangeSelectionColor: theme.primary.withOpacity(0.18),
            startRangeSelectionColor: theme.primary,
            endRangeSelectionColor: theme.primary,
            selectionTextStyle: theme.bodyMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            onSelectionChanged: (args) {
              final value = args.value;
              if (value is PickerDateRange) {
                final start = value.startDate;
                var end = value.endDate ?? value.startDate;

                if (start != null && end != null) {
                  final s = _dateOnly(start);
                  var e = _dateOnly(end);
                  final days = e.difference(s).inDays;

                  // Limiter à 7 jours max
                  if (days > _maxDays) {
                    e = s.add(const Duration(days: _maxDays));
                    end = e;
                    _showMaxDaysSnackbar();
                  }

                  // Vérification chevauchement dates bloquées
                  final hasConflict = blockedDates.any(
                    (blocked) => !blocked.isBefore(s) && !blocked.isAfter(e),
                  );

                  if (hasConflict) {
                    setState(() {
                      _selectedRange = null;
                      _controller.selectedRange = null;
                    });
                    _writeToAppState(null, null);
                    return;
                  }

                  // Mise à jour avec la date de fin corrigée
                  setState(() {
                    _selectedRange = PickerDateRange(start, end);
                    _controller.selectedRange = PickerDateRange(start, end);
                  });

                  _writeToAppState(start, end);
                }
              }
            },
          ),
        );
      },
    );
  }
}
