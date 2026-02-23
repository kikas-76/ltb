import '/flutter_flow/flutter_flow_util.dart';
import 'searchbar_widget.dart' show SearchbarWidget;
import 'package:flutter/material.dart';

class SearchbarModel extends FlutterFlowModel<SearchbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
