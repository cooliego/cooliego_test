import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoolieresponseRecord extends FirestoreRecord {
  CoolieresponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderRef" field.
  String? _orderRef;
  String get orderRef => _orderRef ?? '';
  bool hasOrderRef() => _orderRef != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  void _initializeFields() {
    _orderRef = snapshotData['orderRef'] as String?;
    _accepted = snapshotData['accepted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coolieresponse');

  static Stream<CoolieresponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoolieresponseRecord.fromSnapshot(s));

  static Future<CoolieresponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoolieresponseRecord.fromSnapshot(s));

  static CoolieresponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoolieresponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoolieresponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoolieresponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoolieresponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoolieresponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoolieresponseRecordData({
  String? orderRef,
  bool? accepted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderRef': orderRef,
      'accepted': accepted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoolieresponseRecordDocumentEquality
    implements Equality<CoolieresponseRecord> {
  const CoolieresponseRecordDocumentEquality();

  @override
  bool equals(CoolieresponseRecord? e1, CoolieresponseRecord? e2) {
    return e1?.orderRef == e2?.orderRef && e1?.accepted == e2?.accepted;
  }

  @override
  int hash(CoolieresponseRecord? e) =>
      const ListEquality().hash([e?.orderRef, e?.accepted]);

  @override
  bool isValidKey(Object? o) => o is CoolieresponseRecord;
}
