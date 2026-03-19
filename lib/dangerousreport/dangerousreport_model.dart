import '/flutter_flow/flutter_flow_util.dart';
import 'dangerousreport_widget.dart' show DangerousreportWidget;
import 'package:flutter/material.dart';

class DangerousreportModel extends FlutterFlowModel<DangerousreportWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataYkp = false;
  FFUploadedFile uploadedLocalFile_uploadDataYkp =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData2lj = false;
  FFUploadedFile uploadedLocalFile_uploadData2lj =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
