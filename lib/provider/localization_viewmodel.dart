import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_portfolio/l10n/app_localizations.dart';

enum Language { arabic, english, german, indonesian, urdu, turkish, french, chinese }

class LocalizationProvider with ChangeNotifier {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static Locale? _locale;
  static Language? _selectedLanguage;
  static AppLocalizations? _localizations;
  AppLocalizations? get localizations => _localizations;
  bool get isLoaded => _localizations != null && _selectedLanguage != null;
  LocalizationProvider() {
    _loadSavedLanguage();
  }
  void _loadSavedLanguage() async {
    String? lang = await secureStorage.read(key: 'language');
    if (lang != null) {
      _selectedLanguage = Language.values[int.parse(lang)];
      _locale = _getLocaleFromLanguage(_selectedLanguage!);
      notifyListeners();
    } else {
      _selectedLanguage = Language.english;
      _locale = _getLocaleFromLanguage(_selectedLanguage!);
      notifyListeners();
    }
    _loadLocalizations();
    notifyListeners();
  }

  Future<void> _loadLocalizations() async {
    try {
      _localizations = await AppLocalizations.delegate.load(_locale!);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Locale _getLocaleFromLanguage(Language language) {
    switch (language) {
      case Language.english:
        return const Locale('en', '');
      case Language.arabic:
        return const Locale('ar', '');
      case Language.german:
        return const Locale('de', '');
      case Language.indonesian:
        return const Locale('id', '');
      case Language.urdu:
        return const Locale('ur', '');
      case Language.turkish:
        return const Locale('tr', '');
      case Language.french:
        return const Locale('fr', '');
      case Language.chinese:
        return const Locale('zh', '');
    }
  }

  Language? get selectedLanguage => _selectedLanguage;
  Locale? get locale => _locale;
  void setSelectedLanguage(Language language) async {
    _selectedLanguage = language;
    _locale = _getLocaleFromLanguage(language);
    await secureStorage.write(
      key: 'language',
      value: _selectedLanguage!.index.toString(),
    );
    _loadLocalizations();
    notifyListeners();
  }
}
