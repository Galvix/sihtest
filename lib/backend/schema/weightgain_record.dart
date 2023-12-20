import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightgainRecord extends FirestoreRecord {
  WeightgainRecord._(
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
          ? parent.collection('weightgain')
          : FirebaseFirestore.instance.collectionGroup('weightgain');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('weightgain').doc();

  static Stream<WeightgainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeightgainRecord.fromSnapshot(s));

  static Future<WeightgainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeightgainRecord.fromSnapshot(s));

  static WeightgainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeightgainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeightgainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeightgainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeightgainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeightgainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeightgainRecordData({
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

class WeightgainRecordDocumentEquality implements Equality<WeightgainRecord> {
  const WeightgainRecordDocumentEquality();

  @override
  bool equals(WeightgainRecord? e1, WeightgainRecord? e2) {
    return e1?.bmi == e2?.bmi && e1?.vidurl == e2?.vidurl;
  }

  @override
  int hash(WeightgainRecord? e) =>
      const ListEquality().hash([e?.bmi, e?.vidurl]);

  @override
  bool isValidKey(Object? o) => o is WeightgainRecord;
}
