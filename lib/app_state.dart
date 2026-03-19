import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _tempStartDate = DateTime.fromMillisecondsSinceEpoch(946681200000);
  DateTime? get tempStartDate => _tempStartDate;
  set tempStartDate(DateTime? value) {
    _tempStartDate = value;
  }

  DateTime? _tempEndDate = DateTime.fromMillisecondsSinceEpoch(946681200000);
  DateTime? get tempEndDate => _tempEndDate;
  set tempEndDate(DateTime? value) {
    _tempEndDate = value;
  }

  bool _datesSelected = false;
  bool get datesSelected => _datesSelected;
  set datesSelected(bool value) {
    _datesSelected = value;
  }

  String _filterOwnerType = '';
  String get filterOwnerType => _filterOwnerType;
  set filterOwnerType(String value) {
    _filterOwnerType = value;
  }

  double _filterPriceMin = 0.0;
  double get filterPriceMin => _filterPriceMin;
  set filterPriceMin(double value) {
    _filterPriceMin = value;
  }

  double _filterPriceMax = 99999.0;
  double get filterPriceMax => _filterPriceMax;
  set filterPriceMax(double value) {
    _filterPriceMax = value;
  }
}
