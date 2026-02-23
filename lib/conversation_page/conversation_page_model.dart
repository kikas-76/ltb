import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'conversation_page_widget.dart' show ConversationPageWidget;
import 'package:flutter/material.dart';

class ConversationPageModel extends FlutterFlowModel<ConversationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MessageField widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();
  }
}
