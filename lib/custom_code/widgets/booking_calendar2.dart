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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingCalendar2 extends StatefulWidget {
  const BookingCalendar2({
    super.key,
    this.width,
    this.height,
    required this.listingRef,
  });

  final double? width;
  final double? height;

  /// Référence du document dans la collection `listings`
  final DocumentReference listingRef;

  @override
  State<BookingCalendar2> createState() => _BookingCalendar2State();
}

class _BookingCalendar2State extends State<BookingCalendar2> {
  PickerDateRange? _selectedRange;

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

    final list = blocked.toList()..sort();
    return list;
  }

  void _writeToAppState(DateTime? start, DateTime? end) {
    final s = start == null ? null : _dateOnly(start);
    final e = end == null ? null : _dateOnly(end);

    FFAppState().update(() {
      FFAppState().tempStartDate = s;
      FFAppState().tempEndDate = e;
    });
  }

  PickerDateRange? _initialRangeFromAppState() {
    final s = FFAppState().tempStartDate;
    final e = FFAppState().tempEndDate;

    if (s == null && e == null) return null;

    final start = _dateOnly(s ?? e!);
    final end = _dateOnly(e ?? s!);

    final from = start.isBefore(end) ? start : end;
    final to = start.isBefore(end) ? end : start;

    return PickerDateRange(from, to);
  }

  @override
  void initState() {
    super.initState();
    _selectedRange = _initialRangeFromAppState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    final initialRange = _initialRangeFromAppState();
    final initialDisplayDate = initialRange?.startDate;

    final stream = queryBookingsRecord(
      queryBuilder: (q) => q.where('listing_ref', isEqualTo: widget.listingRef),
    );

    return StreamBuilder<List<BookingsRecord>>(
      stream: stream,
      builder: (context, snapshot) {
        final bookings = snapshot.data ?? const <BookingsRecord>[];
        final blockedDates = _buildBlockedDates(bookings);

        return Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.secondaryBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.alternate),
          ),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            showNavigationArrow: true,
            enablePastDates: false,

            // ✅ Préchargement depuis App State
            initialSelectedRange: initialRange,
            initialDisplayDate: initialDisplayDate,

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
              todayTextStyle:
                  theme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
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

            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              final value = args.value;

              if (value is PickerDateRange) {
                setState(() => _selectedRange = value);
                _writeToAppState(value.startDate, value.endDate);
              }
            },
          ),
        );
      },
    );
  }
}
