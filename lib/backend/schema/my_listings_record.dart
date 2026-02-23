import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyListingsRecord extends FirestoreRecord {
  MyListingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listing_ref" field.
  DocumentReference? _listingRef;
  DocumentReference? get listingRef => _listingRef;
  bool hasListingRef() => _listingRef != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _listingRef = snapshotData['listing_ref'] as DocumentReference?;
    _dateTime = snapshotData['date_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_listings')
          : FirebaseFirestore.instance.collectionGroup('my_listings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_listings').doc(id);

  static Stream<MyListingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyListingsRecord.fromSnapshot(s));

  static Future<MyListingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyListingsRecord.fromSnapshot(s));

  static MyListingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyListingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyListingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyListingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyListingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyListingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyListingsRecordData({
  DocumentReference? listingRef,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'listing_ref': listingRef,
      'date_time': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyListingsRecordDocumentEquality implements Equality<MyListingsRecord> {
  const MyListingsRecordDocumentEquality();

  @override
  bool equals(MyListingsRecord? e1, MyListingsRecord? e2) {
    return e1?.listingRef == e2?.listingRef && e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(MyListingsRecord? e) =>
      const ListEquality().hash([e?.listingRef, e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is MyListingsRecord;
}
