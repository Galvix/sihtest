import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightlogsRecord extends FirestoreRecord {
  WeightlogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

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
    _weight = castToType<double>(snapshotData['weight']);
    _uID = snapshotData['uID'] as DocumentReference?;
    _dnt = snapshotData['dnt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('weightlogs')
          : FirebaseFirestore.instance.collectionGroup('weightlogs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('weightlogs').doc();

  static Stream<WeightlogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeightlogsRecord.fromSnapshot(s));

  static Future<WeightlogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeightlogsRecord.fromSnapshot(s));

  static WeightlogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeightlogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeightlogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeightlogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeightlogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeightlogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeightlogsRecordData({
  double? weight,
  DocumentReference? uID,
  DateTime? dnt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weight': weight,
      'uID': uID,
      'dnt': dnt,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeightlogsRecordDocumentEquality implements Equality<WeightlogsRecord> {
  const WeightlogsRecordDocumentEquality();

  @override
  bool equals(WeightlogsRecord? e1, WeightlogsRecord? e2) {
    return e1?.weight == e2?.weight && e1?.uID == e2?.uID && e1?.dnt == e2?.dnt;
  }

  @override
  int hash(WeightlogsRecord? e) =>
      const ListEquality().hash([e?.weight, e?.uID, e?.dnt]);

  @override
  bool isValidKey(Object? o) => o is WeightlogsRecord;
}
