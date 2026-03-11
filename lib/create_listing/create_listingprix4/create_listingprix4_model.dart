import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_listingprix4_widget.dart' show CreateListingprix4Widget;
import 'package:flutter/material.dart';

class CreateListingprix4Model
    extends FlutterFlowModel<CreateListingprix4Widget> {
  ///  Local state fields for this page.

  double? pricePerDay = 0.0;

  double? deposit = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
  // State field(s) for TextField2 widget.
  FocusNode? textField2FocusNode;
  TextEditingController? textField2TextController;
  String? Function(BuildContext, String?)? textField2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();

    textField2FocusNode?.dispose();
    textField2TextController?.dispose();
  }
}
