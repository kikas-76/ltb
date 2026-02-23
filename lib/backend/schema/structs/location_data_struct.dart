// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationDataStruct extends FFFirebaseStruct {
  LocationDataStruct({
    LatLng? location,
    String? adress,
    String? country,
    String? city,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        _adress = adress,
        _country = country,
        _city = city,
        super(firestoreUtilData);

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  set adress(String? val) => _adress = val;

  bool hasAdress() => _adress != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  static LocationDataStruct fromMap(Map<String, dynamic> data) =>
      LocationDataStruct(
        location: data['location'] as LatLng?,
        adress: data['adress'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
      );

  static LocationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'adress': _adress,
        'country': _country,
        'city': _city,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'adress': serializeParam(
          _adress,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationDataStruct(
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        adress: deserializeParam(
          data['adress'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
      );

  static LocationDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LocationDataStruct(
        location: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        adress: convertAlgoliaParam(
          data['adress'],
          ParamType.String,
          false,
        ),
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LocationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationDataStruct &&
        location == other.location &&
        adress == other.adress &&
        country == other.country &&
        city == other.city;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([location, adress, country, city]);
}

LocationDataStruct createLocationDataStruct({
  LatLng? location,
  String? adress,
  String? country,
  String? city,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationDataStruct(
      location: location,
      adress: adress,
      country: country,
      city: city,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationDataStruct? updateLocationDataStruct(
  LocationDataStruct? locationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationDataStructData(
  Map<String, dynamic> firestoreData,
  LocationDataStruct? locationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationData == null) {
    return;
  }
  if (locationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationDataData =
      getLocationDataFirestoreData(locationData, forFieldValue);
  final nestedData =
      locationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationDataFirestoreData(
  LocationDataStruct? locationData, [
  bool forFieldValue = false,
]) {
  if (locationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationData.toMap());

  // Add any Firestore field values
  locationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationDataListFirestoreData(
  List<LocationDataStruct>? locationDatas,
) =>
    locationDatas?.map((e) => getLocationDataFirestoreData(e, true)).toList() ??
    [];
