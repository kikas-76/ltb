import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'booking_list_component_model.dart';
export 'booking_list_component_model.dart';

class BookingListComponentWidget extends StatefulWidget {
  const BookingListComponentWidget({
    super.key,
    required this.listingRef,
  });

  final DocumentReference? listingRef;

  @override
  State<BookingListComponentWidget> createState() =>
      _BookingListComponentWidgetState();
}

class _BookingListComponentWidgetState
    extends State<BookingListComponentWidget> {
  late BookingListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BookingsRecord>>(
      stream: queryBookingsRecord(
        queryBuilder: (bookingsRecord) => bookingsRecord
            .where(
              'listing_ref',
              isEqualTo: widget.listingRef,
            )
            .orderBy('start_date', descending: true),
        limit: 2,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<BookingsRecord> containerBookingsRecordList = snapshot.data!;

        return Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Builder(
            builder: (context) {
              final bookingItem = containerBookingsRecordList.toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(bookingItem.length, (bookingItemIndex) {
                  final bookingItemItem = bookingItem[bookingItemIndex];
                  return Container(
                      width: 100, height: 100, color: Colors.green);
                }),
              );
            },
          ),
        );
      },
    );
  }
}
