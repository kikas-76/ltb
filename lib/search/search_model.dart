import '/component/searchbar/searchbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for searchbar component.
  late SearchbarModel searchbarModel;

  @override
  void initState(BuildContext context) {
    searchbarModel = createModel(context, () => SearchbarModel());
  }

  @override
  void dispose() {
    searchbarModel.dispose();
  }
}
