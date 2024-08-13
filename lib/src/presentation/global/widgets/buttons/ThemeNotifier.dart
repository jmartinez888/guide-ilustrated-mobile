import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  SharedPreferences? _prefs;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _themeMode = ThemeMode.values[_prefs?.getInt('themeMode') ?? 1];
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs?.setInt('themeMode', _themeMode.index);
  }
}

