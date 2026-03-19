import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'offensantreport_widget.dart' show OffensantreportWidget;
import 'package:flutter/material.dart';

class OffensantreportModel extends FlutterFlowModel<OffensantreportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataHjz = false;
  FFUploadedFile uploadedLocalFile_uploadDataHjz =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
