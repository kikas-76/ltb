import '/flutter_flow/flutter_flow_util.dart';
import 'autrereport_widget.dart' show AutrereportWidget;
import 'package:flutter/material.dart';

class AutrereportModel extends FlutterFlowModel<AutrereportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataX0w = false;
  FFUploadedFile uploadedLocalFile_uploadDataX0w =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
