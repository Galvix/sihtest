import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FitnessdataRecord extends FirestoreRecord {
  FitnessdataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _weight = castToType<double>(snapshotData['weight']);
    _height = castToType<int>(snapshotData['height']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fitnessdata');

  static Stream<FitnessdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FitnessdataRecord.fromSnapshot(s));

  static Future<FitnessdataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FitnessdataRecord.fromSnapshot(s));

  static FitnessdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FitnessdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FitnessdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FitnessdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FitnessdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FitnessdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFitnessdataRecordData({
  DocumentReference? userID,
  double? weight,
  int? height,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'weight': weight,
      'height': height,
    }.withoutNulls,
  );

  return firestoreData;
}

class FitnessdataRecordDocumentEquality implements Equality<FitnessdataRecord> {
  const FitnessdataRecordDocumentEquality();

  @override
  bool equals(FitnessdataRecord? e1, FitnessdataRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height;
  }

  @override
  int hash(FitnessdataRecord? e) =>
      const ListEquality().hash([e?.userID, e?.weight, e?.height]);

  @override
  bool isValidKey(Object? o) => o is FitnessdataRecord;
}
