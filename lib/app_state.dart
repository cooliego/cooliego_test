import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _customerName =
          await secureStorage.getString('ff_customerName') ?? _customerName;
    });
    await _safeInitAsync(() async {
      _customerEmail =
          await secureStorage.getString('ff_customerEmail') ?? _customerEmail;
    });
    await _safeInitAsync(() async {
      _phonenumberuser = await secureStorage.getString('ff_phonenumberuser') ??
          _phonenumberuser;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _baggageWeight = '';
  String get baggageWeight => _baggageWeight;
  set baggageWeight(String value) {
    _baggageWeight = value;
  }

  String _PNRNUMBER = '';
  String get PNRNUMBER => _PNRNUMBER;
  set PNRNUMBER(String value) {
    _PNRNUMBER = value;
  }

  String _dateOfJourney = '';
  String get dateOfJourney => _dateOfJourney;
  set dateOfJourney(String value) {
    _dateOfJourney = value;
  }

  String _trainNumber = '';
  String get trainNumber => _trainNumber;
  set trainNumber(String value) {
    _trainNumber = value;
  }

  String _trainName = '';
  String get trainName => _trainName;
  set trainName(String value) {
    _trainName = value;
  }

  String _sourceStation = '';
  String get sourceStation => _sourceStation;
  set sourceStation(String value) {
    _sourceStation = value;
  }

  String _destinationStation = '';
  String get destinationStation => _destinationStation;
  set destinationStation(String value) {
    _destinationStation = value;
  }

  String _reservationUpto = '';
  String get reservationUpto => _reservationUpto;
  set reservationUpto(String value) {
    _reservationUpto = value;
  }

  String _boardingPoint = '';
  String get boardingPoint => _boardingPoint;
  set boardingPoint(String value) {
    _boardingPoint = value;
  }

  String _journeyClass = '';
  String get journeyClass => _journeyClass;
  set journeyClass(String value) {
    _journeyClass = value;
  }

  String _chartStatus = '';
  String get chartStatus => _chartStatus;
  set chartStatus(String value) {
    _chartStatus = value;
  }

  String _arrivalDate = '';
  String get arrivalDate => _arrivalDate;
  set arrivalDate(String value) {
    _arrivalDate = value;
  }

  LatLng? _currentLocation = LatLng(21.2513844, 81.62964130000002);
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  int _calculatedFare = 0;
  int get calculatedFare => _calculatedFare;
  set calculatedFare(int value) {
    _calculatedFare = value;
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1742854740000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  String _servicestationname = '';
  String get servicestationname => _servicestationname;
  set servicestationname(String value) {
    _servicestationname = value;
  }

  String _serviceType = '';
  String get serviceType => _serviceType;
  set serviceType(String value) {
    _serviceType = value;
  }

  String _transit = '';
  String get transit => _transit;
  set transit(String value) {
    _transit = value;
  }

  String _customerName = '';
  String get customerName => _customerName;
  set customerName(String value) {
    _customerName = value;
    secureStorage.setString('ff_customerName', value);
  }

  void deleteCustomerName() {
    secureStorage.delete(key: 'ff_customerName');
  }

  String _customerEmail = '';
  String get customerEmail => _customerEmail;
  set customerEmail(String value) {
    _customerEmail = value;
    secureStorage.setString('ff_customerEmail', value);
  }

  void deleteCustomerEmail() {
    secureStorage.delete(key: 'ff_customerEmail');
  }

  String _numofbaggagesstring = '';
  String get numofbaggagesstring => _numofbaggagesstring;
  set numofbaggagesstring(String value) {
    _numofbaggagesstring = value;
  }

  String _phonenumberuser = '';
  String get phonenumberuser => _phonenumberuser;
  set phonenumberuser(String value) {
    _phonenumberuser = value;
    secureStorage.setString('ff_phonenumberuser', value);
  }

  void deletePhonenumberuser() {
    secureStorage.delete(key: 'ff_phonenumberuser');
  }

  String _seatnumber = '';
  String get seatnumber => _seatnumber;
  set seatnumber(String value) {
    _seatnumber = value;
  }

  /// customercoach
  String _coach = '';
  String get coach => _coach;
  set coach(String value) {
    _coach = value;
  }

  DateTime? _dateandtime;
  DateTime? get dateandtime => _dateandtime;
  set dateandtime(DateTime? value) {
    _dateandtime = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
