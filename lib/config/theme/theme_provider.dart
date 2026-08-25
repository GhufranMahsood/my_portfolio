import 'package:flutter/material.dart';
import 'package:my_portfolio/config/local/pref_manager.dart';

/// Provider for managing dynamic ThemeMode (Light, Dark, System) across the app
class ThemeProvider extends ChangeNotifier {
  final PrefManager _prefManager;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode _widgetThemeMode = ThemeMode.system;
  bool _isLoaded = false;

  ThemeProvider({PrefManager? prefManager})
      : _prefManager = prefManager ?? PrefManager() {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;
  ThemeMode get widgetThemeMode => _widgetThemeMode;
  bool get isLoaded => _isLoaded;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  Future<void> _loadThemeMode() async {
    final modeString = await _prefManager.getThemeMode();
    if (modeString == 'light') {
      _themeMode = ThemeMode.light;
    } else if (modeString == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system;
    }

    final widgetModeString = await _prefManager.getWidgetThemeMode();
    if (widgetModeString == 'light') {
      _widgetThemeMode = ThemeMode.light;
    } else if (widgetModeString == 'dark') {
      _widgetThemeMode = ThemeMode.dark;
    } else {
      _widgetThemeMode = ThemeMode.system;
    }

    _isLoaded = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();

    String modeString = 'system';
    if (mode == ThemeMode.light) {
      modeString = 'light';
    } else if (mode == ThemeMode.dark) {
      modeString = 'dark';
    }
    await _prefManager.saveThemeMode(modeString);
  }

  Future<void> setWidgetThemeMode(ThemeMode mode) async {
    if (_widgetThemeMode == mode) return;
    _widgetThemeMode = mode;
    notifyListeners();

    String modeString = 'system';
    if (mode == ThemeMode.light) {
      modeString = 'light';
    } else if (mode == ThemeMode.dark) {
      modeString = 'dark';
    }
    await _prefManager.saveWidgetThemeMode(modeString);
  }

  Future<void> toggleTheme(BuildContext context) async {
    final currentBrightness = Theme.of(context).brightness;
    if (currentBrightness == Brightness.dark) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }
}
