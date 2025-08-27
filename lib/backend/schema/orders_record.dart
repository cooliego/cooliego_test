import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "serviceType" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  bool hasServiceType() => _serviceType != null;

  // "totalWeight" field.
  String? _totalWeight;
  String get totalWeight => _totalWeight ?? '';
  bool hasTotalWeight() => _totalWeight != null;

  // "serviceStation" field.
  String? _serviceStation;
  String get serviceStation => _serviceStation ?? '';
  bool hasServiceStation() => _serviceStation != null;

  // "orderValue" field.
  String? _orderValue;
  String get orderValue => _orderValue ?? '';
  bool hasOrderValue() => _orderValue != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "serviceLocation" field.
  LatLng? _serviceLocation;
  LatLng? get serviceLocation => _serviceLocation;
  bool hasServiceLocation() => _serviceLocation != null;

  // "transit" field.
  String? _transit;
  String get transit => _transit ?? '';
  bool hasTransit() => _transit != null;

  // "seatnumber" field.
  String? _seatnumber;
  String get seatnumber => _seatnumber ?? '';
  bool hasSeatnumber() => _seatnumber != null;

  // "numItems" field.
  String? _numItems;
  String get numItems => _numItems ?? '';
  bool hasNumItems() => _numItems != null;

  // "customerPhoneNumber" field.
  String? _customerPhoneNumber;
  String get customerPhoneNumber => _customerPhoneNumber ?? '';
  bool hasCustomerPhoneNumber() => _customerPhoneNumber != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "coach" field.
  String? _coach;
  String get coach => _coach ?? '';
  bool hasCoach() => _coach != null;

  // "trainNumber" field.
  String? _trainNumber;
  String get trainNumber => _trainNumber ?? '';
  bool hasTrainNumber() => _trainNumber != null;

  // "dateandtime" field.
  DateTime? _dateandtime;
  DateTime? get dateandtime => _dateandtime;
  bool hasDateandtime() => _dateandtime != null;

  void _initializeFields() {
    _serviceType = snapshotData['serviceType'] as String?;
    _totalWeight = snapshotData['totalWeight'] as String?;
    _serviceStation = snapshotData['serviceStation'] as String?;
    _orderValue = snapshotData['orderValue'] as String?;
    _customerName = snapshotData['customerName'] as String?;
    _serviceLocation = snapshotData['serviceLocation'] as LatLng?;
    _transit = snapshotData['transit'] as String?;
    _seatnumber = snapshotData['seatnumber'] as String?;
    _numItems = snapshotData['numItems'] as String?;
    _customerPhoneNumber = snapshotData['customerPhoneNumber'] as String?;
    _userID = snapshotData['userID'] as String?;
    _status = snapshotData['status'] as String?;
    _coach = snapshotData['coach'] as String?;
    _trainNumber = snapshotData['trainNumber'] as String?;
    _dateandtime = snapshotData['dateandtime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? serviceType,
  String? totalWeight,
  String? serviceStation,
  String? orderValue,
  String? customerName,
  LatLng? serviceLocation,
  String? transit,
  String? seatnumber,
  String? numItems,
  String? customerPhoneNumber,
  String? userID,
  String? status,
  String? coach,
  String? trainNumber,
  DateTime? dateandtime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serviceType': serviceType,
      'totalWeight': totalWeight,
      'serviceStation': serviceStation,
      'orderValue': orderValue,
      'customerName': customerName,
      'serviceLocation': serviceLocation,
      'transit': transit,
      'seatnumber': seatnumber,
      'numItems': numItems,
      'customerPhoneNumber': customerPhoneNumber,
      'userID': userID,
      'status': status,
      'coach': coach,
      'trainNumber': trainNumber,
      'dateandtime': dateandtime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.serviceType == e2?.serviceType &&
        e1?.totalWeight == e2?.totalWeight &&
        e1?.serviceStation == e2?.serviceStation &&
        e1?.orderValue == e2?.orderValue &&
        e1?.customerName == e2?.customerName &&
        e1?.serviceLocation == e2?.serviceLocation &&
        e1?.transit == e2?.transit &&
        e1?.seatnumber == e2?.seatnumber &&
        e1?.numItems == e2?.numItems &&
        e1?.customerPhoneNumber == e2?.customerPhoneNumber &&
        e1?.userID == e2?.userID &&
        e1?.status == e2?.status &&
        e1?.coach == e2?.coach &&
        e1?.trainNumber == e2?.trainNumber &&
        e1?.dateandtime == e2?.dateandtime;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.serviceType,
        e?.totalWeight,
        e?.serviceStation,
        e?.orderValue,
        e?.customerName,
        e?.serviceLocation,
        e?.transit,
        e?.seatnumber,
        e?.numItems,
        e?.customerPhoneNumber,
        e?.userID,
        e?.status,
        e?.coach,
        e?.trainNumber,
        e?.dateandtime
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
