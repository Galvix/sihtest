import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SteplogRecord extends FirestoreRecord {
  SteplogRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  // "cal" field.
  double? _cal;
  double get cal => _cal ?? 0.0;
  bool hasCal() => _cal != null;

  // "uID" field.
  DocumentReference? _uID;
  DocumentReference? get uID => _uID;
  bool hasUID() => _uID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _steps = castToType<int>(snapshotData['steps']);
    _cal = castToType<double>(snapshotData['cal']);
    _uID = snapshotData['uID'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('steplog')
          : FirebaseFirestore.instance.collectionGroup('steplog');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('steplog').doc();

  static Stream<SteplogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SteplogRecord.fromSnapshot(s));

  static Future<SteplogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SteplogRecord.fromSnapshot(s));

  static SteplogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SteplogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SteplogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SteplogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SteplogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SteplogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSteplogRecordData({
  int? steps,
  double? cal,
  DocumentReference? uID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'steps': steps,
      'cal': cal,
      'uID': uID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SteplogRecordDocumentEquality implements Equality<SteplogRecord> {
  const SteplogRecordDocumentEquality();

  @override
  bool equals(SteplogRecord? e1, SteplogRecord? e2) {
    return e1?.steps == e2?.steps && e1?.cal == e2?.cal && e1?.uID == e2?.uID;
  }

  @override
  int hash(SteplogRecord? e) =>
      const ListEquality().hash([e?.steps, e?.cal, e?.uID]);

  @override
  bool isValidKey(Object? o) => o is SteplogRecord;
}
