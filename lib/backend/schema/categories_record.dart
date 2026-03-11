import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
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

  // "icon_path" field.
  String? _iconPath;
  String get iconPath => _iconPath ?? '';
  bool hasIconPath() => _iconPath != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _iconPath = snapshotData['icon_path'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _value = snapshotData['value'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  String? description,
  String? iconPath,
  Color? color,
  String? value,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'icon_path': iconPath,
      'color': color,
      'value': value,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.iconPath == e2?.iconPath &&
        e1?.color == e2?.color &&
        e1?.value == e2?.value &&
        e1?.order == e2?.order;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash(
      [e?.name, e?.description, e?.iconPath, e?.color, e?.value, e?.order]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
