import '/flutter_flow/flutter_flow_util.dart';
import 'pubreport_widget.dart' show PubreportWidget;
import 'package:flutter/material.dart';

class PubreportModel extends FlutterFlowModel<PubreportWidget> {
  ///  State fields for stateful widgets in this page.

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
