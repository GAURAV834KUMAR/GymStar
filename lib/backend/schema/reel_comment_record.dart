import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReelCommentRecord extends FirestoreRecord {
  ReelCommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Reel_user" field.
  DocumentReference? _reelUser;
  DocumentReference? get reelUser => _reelUser;
  bool hasReelUser() => _reelUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reelUser = snapshotData['Reel_user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reel_comment')
          : FirebaseFirestore.instance.collectionGroup('Reel_comment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Reel_comment').doc();

  static Stream<ReelCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReelCommentRecord.fromSnapshot(s));

  static Future<ReelCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReelCommentRecord.fromSnapshot(s));

  static ReelCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReelCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReelCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReelCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReelCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReelCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReelCommentRecordData({
  DocumentReference? reelUser,
  DateTime? createdTime,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Reel_user': reelUser,
      'created_time': createdTime,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReelCommentRecordDocumentEquality implements Equality<ReelCommentRecord> {
  const ReelCommentRecordDocumentEquality();

  @override
  bool equals(ReelCommentRecord? e1, ReelCommentRecord? e2) {
    return e1?.reelUser == e2?.reelUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(ReelCommentRecord? e) =>
      const ListEquality().hash([e?.reelUser, e?.createdTime, e?.comment]);

  @override
  bool isValidKey(Object? o) => o is ReelCommentRecord;
}
