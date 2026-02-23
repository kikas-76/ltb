import '/flutter_flow/flutter_flow_util.dart';
import 'edit_booking_component_widget.dart' show EditBookingComponentWidget;
import 'package:flutter/material.dart';

class EditBookingComponentModel
    extends FlutterFlowModel<EditBookingComponentWidget> {
  ///  Local state fields for this component.

  DateTime? tempStartDate;

  DateTime? tempEndDate;

  double tempTotalPrice = 1.0;

  bool editPrie = false;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
