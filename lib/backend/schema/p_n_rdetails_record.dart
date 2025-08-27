import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PNRdetailsRecord extends FirestoreRecord {
  PNRdetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pnrNumber" field.
  String? _pnrNumber;
  String get pnrNumber => _pnrNumber ?? '';
  bool hasPnrNumber() => _pnrNumber != null;

  // "dateOfJourney" field.
  DateTime? _dateOfJourney;
  DateTime? get dateOfJourney => _dateOfJourney;
  bool hasDateOfJourney() => _dateOfJourney != null;

  // "trainNumber" field.
  String? _trainNumber;
  String get trainNumber => _trainNumber ?? '';
  bool hasTrainNumber() => _trainNumber != null;

  // "trainName" field.
  String? _trainName;
  String get trainName => _trainName ?? '';
  bool hasTrainName() => _trainName != null;

  // "journeyClass" field.
  String? _journeyClass;
  String get journeyClass => _journeyClass ?? '';
  bool hasJourneyClass() => _journeyClass != null;

  // "numberOfPassengers" field.
  int? _numberOfPassengers;
  int get numberOfPassengers => _numberOfPassengers ?? 0;
  bool hasNumberOfPassengers() => _numberOfPassengers != null;

  // "chartStatus" field.
  String? _chartStatus;
  String get chartStatus => _chartStatus ?? '';
  bool hasChartStatus() => _chartStatus != null;

  // "sourceStation" field.
  String? _sourceStation;
  String get sourceStation => _sourceStation ?? '';
  bool hasSourceStation() => _sourceStation != null;

  // "destinationStation" field.
  String? _destinationStation;
  String get destinationStation => _destinationStation ?? '';
  bool hasDestinationStation() => _destinationStation != null;

  void _initializeFields() {
    _pnrNumber = snapshotData['pnrNumber'] as String?;
    _dateOfJourney = snapshotData['dateOfJourney'] as DateTime?;
    _trainNumber = snapshotData['trainNumber'] as String?;
    _trainName = snapshotData['trainName'] as String?;
    _journeyClass = snapshotData['journeyClass'] as String?;
    _numberOfPassengers = castToType<int>(snapshotData['numberOfPassengers']);
    _chartStatus = snapshotData['chartStatus'] as String?;
    _sourceStation = snapshotData['sourceStation'] as String?;
    _destinationStation = snapshotData['destinationStation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PNRdetails');

  static Stream<PNRdetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PNRdetailsRecord.fromSnapshot(s));

  static Future<PNRdetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PNRdetailsRecord.fromSnapshot(s));

  static PNRdetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PNRdetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PNRdetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PNRdetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PNRdetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PNRdetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPNRdetailsRecordData({
  String? pnrNumber,
  DateTime? dateOfJourney,
  String? trainNumber,
  String? trainName,
  String? journeyClass,
  int? numberOfPassengers,
  String? chartStatus,
  String? sourceStation,
  String? destinationStation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pnrNumber': pnrNumber,
      'dateOfJourney': dateOfJourney,
      'trainNumber': trainNumber,
      'trainName': trainName,
      'journeyClass': journeyClass,
      'numberOfPassengers': numberOfPassengers,
      'chartStatus': chartStatus,
      'sourceStation': sourceStation,
      'destinationStation': destinationStation,
    }.withoutNulls,
  );

  return firestoreData;
}

class PNRdetailsRecordDocumentEquality implements Equality<PNRdetailsRecord> {
  const PNRdetailsRecordDocumentEquality();

  @override
  bool equals(PNRdetailsRecord? e1, PNRdetailsRecord? e2) {
    return e1?.pnrNumber == e2?.pnrNumber &&
        e1?.dateOfJourney == e2?.dateOfJourney &&
        e1?.trainNumber == e2?.trainNumber &&
        e1?.trainName == e2?.trainName &&
        e1?.journeyClass == e2?.journeyClass &&
        e1?.numberOfPassengers == e2?.numberOfPassengers &&
        e1?.chartStatus == e2?.chartStatus &&
        e1?.sourceStation == e2?.sourceStation &&
        e1?.destinationStation == e2?.destinationStation;
  }

  @override
  int hash(PNRdetailsRecord? e) => const ListEquality().hash([
        e?.pnrNumber,
        e?.dateOfJourney,
        e?.trainNumber,
        e?.trainName,
        e?.journeyClass,
        e?.numberOfPassengers,
        e?.chartStatus,
        e?.sourceStation,
        e?.destinationStation
      ]);

  @override
  bool isValidKey(Object? o) => o is PNRdetailsRecord;
}
