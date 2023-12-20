import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MuscleRecord extends FirestoreRecord {
  MuscleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bmi" field.
  int? _bmi;
  int get bmi => _bmi ?? 0;
  bool hasBmi() => _bmi != null;

  // "vidurl" field.
  String? _vidurl;
  String get vidurl => _vidurl ?? '';
  bool hasVidurl() => _vidurl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bmi = castToType<int>(snapshotData['bmi']);
    _vidurl = snapshotData['vidurl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('muscle')
          : FirebaseFirestore.instance.collectionGroup('muscle');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('muscle').doc();

  static Stream<MuscleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MuscleRecord.fromSnapshot(s));

  static Future<MuscleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MuscleRecord.fromSnapshot(s));

  static MuscleRecord fromSnapshot(DocumentSnapshot snapshot) => MuscleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MuscleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MuscleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MuscleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MuscleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMuscleRecordData({
  int? bmi,
  String? vidurl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bmi': bmi,
      'vidurl': vidurl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MuscleRecordDocumentEquality implements Equality<MuscleRecord> {
  const MuscleRecordDocumentEquality();

  @override
  bool equals(MuscleRecord? e1, MuscleRecord? e2) {
    return e1?.bmi == e2?.bmi && e1?.vidurl == e2?.vidurl;
  }

  @override
  int hash(MuscleRecord? e) => const ListEquality().hash([e?.bmi, e?.vidurl]);

  @override
  bool isValidKey(Object? o) => o is MuscleRecord;
}
