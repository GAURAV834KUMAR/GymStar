import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReelsRecord extends FirestoreRecord {
  ReelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "User_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "Post_date" field.
  DateTime? _postDate;
  DateTime? get postDate => _postDate;
  bool hasPostDate() => _postDate != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "Video_url" field.
  LatLng? _videoUrl;
  LatLng? get videoUrl => _videoUrl;
  bool hasVideoUrl() => _videoUrl != null;

  void _initializeFields() {
    _userId = snapshotData['User_id'] as DocumentReference?;
    _postDate = snapshotData['Post_date'] as DateTime?;
    _video = snapshotData['video'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _videoUrl = snapshotData['Video_url'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reels');

  static Stream<ReelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReelsRecord.fromSnapshot(s));

  static Future<ReelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReelsRecord.fromSnapshot(s));

  static ReelsRecord fromSnapshot(DocumentSnapshot snapshot) => ReelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReelsRecordData({
  DocumentReference? userId,
  DateTime? postDate,
  String? video,
  LatLng? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'User_id': userId,
      'Post_date': postDate,
      'video': video,
      'Video_url': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReelsRecordDocumentEquality implements Equality<ReelsRecord> {
  const ReelsRecordDocumentEquality();

  @override
  bool equals(ReelsRecord? e1, ReelsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.postDate == e2?.postDate &&
        e1?.video == e2?.video &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(ReelsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.postDate, e?.video, e?.likes, e?.videoUrl]);

  @override
  bool isValidKey(Object? o) => o is ReelsRecord;
}
