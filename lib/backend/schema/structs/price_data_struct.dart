// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PriceDataStruct extends FFFirebaseStruct {
  PriceDataStruct({
    double? price,
    String? currency,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _price = price,
        _currency = currency,
        super(firestoreUtilData);

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  static PriceDataStruct fromMap(Map<String, dynamic> data) => PriceDataStruct(
        price: castToType<double>(data['price']),
        currency: data['currency'] as String?,
      );

  static PriceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'currency': _currency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
      }.withoutNulls;

  static PriceDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PriceDataStruct(
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
      );

  static PriceDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PriceDataStruct(
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        currency: convertAlgoliaParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PriceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PriceDataStruct &&
        price == other.price &&
        currency == other.currency;
  }

  @override
  int get hashCode => const ListEquality().hash([price, currency]);
}

PriceDataStruct createPriceDataStruct({
  double? price,
  String? currency,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PriceDataStruct(
      price: price,
      currency: currency,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PriceDataStruct? updatePriceDataStruct(
  PriceDataStruct? priceData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    priceData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPriceDataStructData(
  Map<String, dynamic> firestoreData,
  PriceDataStruct? priceData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (priceData == null) {
    return;
  }
  if (priceData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && priceData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final priceDataData = getPriceDataFirestoreData(priceData, forFieldValue);
  final nestedData = priceDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = priceData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPriceDataFirestoreData(
  PriceDataStruct? priceData, [
  bool forFieldValue = false,
]) {
  if (priceData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(priceData.toMap());

  // Add any Firestore field values
  priceData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPriceDataListFirestoreData(
  List<PriceDataStruct>? priceDatas,
) =>
    priceDatas?.map((e) => getPriceDataFirestoreData(e, true)).toList() ?? [];
