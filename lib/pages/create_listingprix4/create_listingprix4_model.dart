import '/flutter_flow/flutter_flow_util.dart';
import 'create_listingprix4_widget.dart' show CreateListingprix4Widget;
import 'package:flutter/material.dart';

class CreateListingprix4Model
    extends FlutterFlowModel<CreateListingprix4Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceFocusNode?.dispose();
    priceTextController?.dispose();
  }
}
