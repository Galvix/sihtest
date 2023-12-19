import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HeightlogsRecord extends FirestoreRecord {
  HeightlogsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "uID" field.
  DocumentReference? _uID;
  DocumentReference? get uID => _uID;
  bool hasUID() => _uID != null;

  // "dnt" field.
  DateTime? _dnt;
  DateTime? get dnt => _dnt;
  bool hasDnt() => _dnt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _height = castToType<int>(snapshotData['height']);
    _uID = snapshotData['uID'] as DocumentReference?;
    _dnt = snapshotData['dnt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('heightlogs')
          : FirebaseFirestore.instance.collectionGroup('heightlogs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('heightlogs').doc();

  static Stream<HeightlogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeightlogsRecord.fromSnapshot(s));

  static Future<HeightlogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeightlogsRecord.fromSnapshot(s));

  static HeightlogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HeightlogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeightlogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeightlogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeightlogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeightlogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeightlogsRecordData({
  int? height,
  DocumentReference? uID,
  DateTime? dnt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'height': height,
      'uID': uID,
      'dnt': dnt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HeightlogsRecordDocumentEquality implements Equality<HeightlogsRecord> {
  const HeightlogsRecordDocumentEquality();

  @override
  bool equals(HeightlogsRecord? e1, HeightlogsRecord? e2) {
    return e1?.height == e2?.height && e1?.uID == e2?.uID && e1?.dnt == e2?.dnt;
  }

  @override
  int hash(HeightlogsRecord? e) =>
      const ListEquality().hash([e?.height, e?.uID, e?.dnt]);

  @override
  bool isValidKey(Object? o) => o is HeightlogsRecord;
}
