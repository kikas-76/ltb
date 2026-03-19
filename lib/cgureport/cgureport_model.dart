import '/flutter_flow/flutter_flow_util.dart';
import 'cgureport_widget.dart' show CgureportWidget;
import 'package:flutter/material.dart';

class CgureportModel extends FlutterFlowModel<CgureportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataRjk = false;
  FFUploadedFile uploadedLocalFile_uploadDataRjk =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
