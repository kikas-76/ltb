import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyBookingsRecord extends FirestoreRecord {
  MyBookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _dateTime = snapshotData['date_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_bookings')
          : FirebaseFirestore.instance.collectionGroup('my_bookings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_bookings').doc(id);

  static Stream<MyBookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyBookingsRecord.fromSnapshot(s));

  static Future<MyBookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyBookingsRecord.fromSnapshot(s));

  static MyBookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyBookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyBookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyBookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyBookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyBookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyBookingsRecordData({
  DocumentReference? bookingRef,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking_ref': bookingRef,
      'date_time': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyBookingsRecordDocumentEquality implements Equality<MyBookingsRecord> {
  const MyBookingsRecordDocumentEquality();

  @override
  bool equals(MyBookingsRecord? e1, MyBookingsRecord? e2) {
    return e1?.bookingRef == e2?.bookingRef && e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(MyBookingsRecord? e) =>
      const ListEquality().hash([e?.bookingRef, e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is MyBookingsRecord;
}
