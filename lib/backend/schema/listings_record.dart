import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListingsRecord extends FirestoreRecord {
  ListingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "photos_url" field.
  List<String>? _photosUrl;
  List<String> get photosUrl => _photosUrl ?? const [];
  bool hasPhotosUrl() => _photosUrl != null;

  // "location_data" field.
  LocationDataStruct? _locationData;
  LocationDataStruct get locationData => _locationData ?? LocationDataStruct();
  bool hasLocationData() => _locationData != null;

  // "category_ref" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _isActive = snapshotData['is_active'] as bool?;
    _photosUrl = getDataList(snapshotData['photos_url']);
    _locationData = snapshotData['location_data'] is LocationDataStruct
        ? snapshotData['location_data']
        : LocationDataStruct.maybeFromMap(snapshotData['location_data']);
    _categoryRef = snapshotData['category_ref'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listings');

  static Stream<ListingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListingsRecord.fromSnapshot(s));

  static Future<ListingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListingsRecord.fromSnapshot(s));

  static ListingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListingsRecord._(reference, mapFromFirestore(data));

  static ListingsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ListingsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'owner_ref': convertAlgoliaParam(
            snapshot.data['owner_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'is_active': snapshot.data['is_active'],
          'photos_url': safeGet(
            () => snapshot.data['photos_url'].toList(),
          ),
          'location_data': LocationDataStruct.fromAlgoliaData(
                  snapshot.data['location_data'] ?? {})
              .toMap(),
          'category_ref': convertAlgoliaParam(
            snapshot.data['category_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
        },
        ListingsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ListingsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'listings',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ListingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListingsRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  DocumentReference? ownerRef,
  bool? isActive,
  LocationDataStruct? locationData,
  DocumentReference? categoryRef,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'created_at': createdAt,
      'owner_ref': ownerRef,
      'is_active': isActive,
      'location_data': LocationDataStruct().toMap(),
      'category_ref': categoryRef,
      'location': location,
    }.withoutNulls,
  );

  // Handle nested data for "location_data" field.
  addLocationDataStructData(firestoreData, locationData, 'location_data');

  return firestoreData;
}

class ListingsRecordDocumentEquality implements Equality<ListingsRecord> {
  const ListingsRecordDocumentEquality();

  @override
  bool equals(ListingsRecord? e1, ListingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.isActive == e2?.isActive &&
        listEquality.equals(e1?.photosUrl, e2?.photosUrl) &&
        e1?.locationData == e2?.locationData &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.location == e2?.location;
  }

  @override
  int hash(ListingsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.createdAt,
        e?.ownerRef,
        e?.isActive,
        e?.photosUrl,
        e?.locationData,
        e?.categoryRef,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is ListingsRecord;
}
