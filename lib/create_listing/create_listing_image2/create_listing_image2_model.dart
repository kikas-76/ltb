import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_listing_image2_widget.dart' show CreateListingImage2Widget;
import 'package:flutter/material.dart';

class CreateListingImage2Model
    extends FlutterFlowModel<CreateListingImage2Widget> {
  ///  Local state fields for this page.

  List<String> uploadedPhotos = [];
  void addToUploadedPhotos(String item) => uploadedPhotos.add(item);
  void removeFromUploadedPhotos(String item) => uploadedPhotos.remove(item);
  void removeAtIndexFromUploadedPhotos(int index) =>
      uploadedPhotos.removeAt(index);
  void insertAtIndexInUploadedPhotos(int index, String item) =>
      uploadedPhotos.insert(index, item);
  void updateUploadedPhotosAtIndex(int index, Function(String) updateFn) =>
      uploadedPhotos[index] = updateFn(uploadedPhotos[index]);

  bool isUploading = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataaVkv = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataaVkv = [];
  List<String> uploadedFileUrls_uploadDataaVkv = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
