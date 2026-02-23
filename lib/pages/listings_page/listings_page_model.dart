import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'listings_page_widget.dart' show ListingsPageWidget;
import 'package:flutter/material.dart';

class ListingsPageModel extends FlutterFlowModel<ListingsPageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedStartDate;

  DateTime? selectedEndDate;

  int numberOfDays = 0;

  bool existingBooking = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ListingsPage widget.
  BookingsRecord? currentBooking;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BookingsRecord? newBooking;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
