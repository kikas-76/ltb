import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData1mc = false;
  FFUploadedFile uploadedLocalFile_uploadData1mc =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData1mc = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for uptadtemail widget.
  FocusNode? uptadtemailFocusNode1;
  TextEditingController? uptadtemailTextController1;
  String? Function(BuildContext, String?)? uptadtemailTextController1Validator;
  // State field(s) for uptadtemail widget.
  FocusNode? uptadtemailFocusNode2;
  TextEditingController? uptadtemailTextController2;
  String? Function(BuildContext, String?)? uptadtemailTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    uptadtemailFocusNode1?.dispose();
    uptadtemailTextController1?.dispose();

    uptadtemailFocusNode2?.dispose();
    uptadtemailTextController2?.dispose();
  }
}
