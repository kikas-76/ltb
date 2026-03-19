import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "listing_ref" field.
  DocumentReference? _listingRef;
  DocumentReference? get listingRef => _listingRef;
  bool hasListingRef() => _listingRef != null;

  // "renter_ref" field.
  DocumentReference? _renterRef;
  DocumentReference? get renterRef => _renterRef;
  bool hasRenterRef() => _renterRef != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _listingRef = snapshotData['listing_ref'] as DocumentReference?;
    _renterRef = snapshotData['renter_ref'] as DocumentReference?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _lastMessage = snapshotData['last_message'] as String?;
    _participants = getDataList(snapshotData['participants']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  String? status,
  DocumentReference? listingRef,
  DocumentReference? renterRef,
  DateTime? startDate,
  DateTime? endDate,
  DateTime? createdAt,
  String? lastMessage,
  double? totalPrice,
  DocumentReference? ownerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'listing_ref': listingRef,
      'renter_ref': renterRef,
      'start_date': startDate,
      'end_date': endDate,
      'created_at': createdAt,
      'last_message': lastMessage,
      'total_price': totalPrice,
      'owner_ref': ownerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.listingRef == e2?.listingRef &&
        e1?.renterRef == e2?.renterRef &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.ownerRef == e2?.ownerRef;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.listingRef,
        e?.renterRef,
        e?.startDate,
        e?.endDate,
        e?.createdAt,
        e?.lastMessage,
        e?.participants,
        e?.totalPrice,
        e?.ownerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
