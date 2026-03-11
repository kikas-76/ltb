import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_listing_nom1_widget.dart' show CreateListingNom1Widget;
import 'package:flutter/material.dart';

class CreateListingNom1Model extends FlutterFlowModel<CreateListingNom1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ListingsRecord? createdListing;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
