import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightlossRecord extends FirestoreRecord {
  WeightlossRecord._(
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
          ? parent.collection('weightloss')
          : FirebaseFirestore.instance.collectionGroup('weightloss');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('weightloss').doc();

  static Stream<WeightlossRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeightlossRecord.fromSnapshot(s));

  static Future<WeightlossRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeightlossRecord.fromSnapshot(s));

  static WeightlossRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeightlossRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeightlossRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeightlossRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeightlossRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeightlossRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeightlossRecordData({
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

class WeightlossRecordDocumentEquality implements Equality<WeightlossRecord> {
  const WeightlossRecordDocumentEquality();

  @override
  bool equals(WeightlossRecord? e1, WeightlossRecord? e2) {
    return e1?.bmi == e2?.bmi && e1?.vidurl == e2?.vidurl;
  }

  @override
  int hash(WeightlossRecord? e) =>
      const ListEquality().hash([e?.bmi, e?.vidurl]);

  @override
  bool isValidKey(Object? o) => o is WeightlossRecord;
}
