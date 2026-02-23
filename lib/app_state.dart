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

  DateTime? _tempStartDate;
  DateTime? get tempStartDate => _tempStartDate;
  set tempStartDate(DateTime? value) {
    _tempStartDate = value;
  }

  DateTime? _tempEndDate;
  DateTime? get tempEndDate => _tempEndDate;
  set tempEndDate(DateTime? value) {
    _tempEndDate = value;
  }
}
