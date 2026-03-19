import '/flutter_flow/flutter_flow_util.dart';
import 'volreport_widget.dart' show VolreportWidget;
import 'package:flutter/material.dart';

class VolreportModel extends FlutterFlowModel<VolreportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData6p3 = false;
  FFUploadedFile uploadedLocalFile_uploadData6p3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
