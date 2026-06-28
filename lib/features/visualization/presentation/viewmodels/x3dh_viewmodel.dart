import 'package:flutter/material.dart';

/// ViewModel for X3DH visualization state
class X3DHViewModel extends ChangeNotifier {
  bool _isInitialized = false;
  bool _isComputing = false;

  bool get isInitialized => _isInitialized;
  bool get isComputing => _isComputing;

  void setComputing(bool value) {
    _isComputing = value;
    notifyListeners();
  }

  void setInitialized(bool value) {
    _isInitialized = value;
    notifyListeners();
  }
}
