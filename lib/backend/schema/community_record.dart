import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommunityRecord extends FirestoreRecord {
  CommunityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  List<String>? _message;
  List<String> get message => _message ?? const [];
  bool hasMessage() => _message != null;

  // "message_ref" field.
  List<String>? _messageRef;
  List<String> get messageRef => _messageRef ?? const [];
  bool hasMessageRef() => _messageRef != null;

  void _initializeFields() {
    _message = getDataList(snapshotData['message']);
    _messageRef = getDataList(snapshotData['message_ref']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('community');

  static Stream<CommunityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityRecord.fromSnapshot(s));

  static Future<CommunityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityRecord.fromSnapshot(s));

  static CommunityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class CommunityRecordDocumentEquality implements Equality<CommunityRecord> {
  const CommunityRecordDocumentEquality();

  @override
  bool equals(CommunityRecord? e1, CommunityRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.message, e2?.message) &&
        listEquality.equals(e1?.messageRef, e2?.messageRef);
  }

  @override
  int hash(CommunityRecord? e) =>
      const ListEquality().hash([e?.message, e?.messageRef]);

  @override
  bool isValidKey(Object? o) => o is CommunityRecord;
}
