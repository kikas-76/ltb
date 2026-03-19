import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_listings_widget.dart' show MyListingsWidget;
import 'package:flutter/material.dart';

class MyListingsModel extends FlutterFlowModel<MyListingsWidget> {
  ///  Local state fields for this page.

  String currentTab = 'activite';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
