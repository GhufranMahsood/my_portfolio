import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PrefManager {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> saveUser(dynamic data) async {
    try {
      log("Saving user data: ${jsonEncode(data)}");
      await secureStorage.write(key: Pref.userData, value: jsonEncode(data));
      await secureStorage.write(key: Pref.isLoggedIn, value: "1");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> readUser() async {
    try {
      String? userData = await secureStorage.read(key: Pref.userData);
      return userData != null ? jsonDecode(userData) : null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      String? isLoggedIn = await secureStorage.read(key: Pref.isLoggedIn);
      return isLoggedIn == "1";
    } catch (e) {
      return false;
    }
  }

  Future<bool> isFirstTime() async {
    try {
      String? firstTime = await secureStorage.read(key: Pref.firstTime);
      return firstTime == null ? true : firstTime == "true";
    } catch (e) {
      return true;
    }
  }

  Future<bool> setLoggedIn() async {
    try {
      await secureStorage.write(key: Pref.isLoggedIn, value: "1");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setFirstTime() async {
    try {
      await secureStorage.write(key: Pref.firstTime, value: "false");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await secureStorage.delete(key: Pref.userData);
      await secureStorage.write(key: Pref.isLoggedIn, value: "0");
      await secureStorage.delete(key: Pref.isPremium);
      await secureStorage.delete(key: Pref.lastPremiumCheck);
      await secureStorage.delete(key: Pref.hasUsedTrial);
      await secureStorage.delete(key: Pref.trialExpiryDate);
      await secureStorage.delete(key: Pref.subscriptionExpiryDate);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearAll() async {
    try {
      await secureStorage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveUserId(String userId) async {
    await secureStorage.write(key: Pref.userId, value: userId);
  }

  Future<String?> getUserId() async {
    return await secureStorage.read(key: Pref.userId);
  }

  Future<void> saveHomeWidgetHabitId(String habitId) async {
    await secureStorage.write(key: Pref.homeWidgetHabitId, value: habitId);
  }

  Future<String?> getHomeWidgetHabitId() async {
    return await secureStorage.read(key: Pref.homeWidgetHabitId);
  }

  Future<void> saveCity(String city) async {
    await secureStorage.write(key: Pref.city, value: city);
  }

  Future<void> saveUserType(String type) async {
    await secureStorage.write(key: Pref.userType, value: type);
  }

  Future<String?> getUserType() async {
    return await secureStorage.read(key: Pref.userType);
  }

  Future<void> saveJourneyMode(String mode) async {
    await secureStorage.write(key: Pref.journeyMode, value: mode);
  }

  Future<String?> getJourneyMode() async {
    return await secureStorage.read(key: Pref.journeyMode);
  }

  Future<void> saveLocation(
    String city,
    String country, {
    String? lat,
    String? long,
  }) async {
    await secureStorage.write(key: Pref.city, value: city);
    await secureStorage.write(key: Pref.country, value: country);
    if (lat != null) await secureStorage.write(key: Pref.lat, value: lat);
    if (long != null) await secureStorage.write(key: Pref.long, value: long);
  }

  Future<Map<String, String?>> readLocation() async {
    String? city = await secureStorage.read(key: Pref.city);
    String? country = await secureStorage.read(key: Pref.country);
    String? lat = await secureStorage.read(key: Pref.lat);
    String? long = await secureStorage.read(key: Pref.long);
    return {'city': city, 'country': country, 'lat': lat, 'long': long};
  }

  Future<String> readUserId() async {
    final user = await readUser();
    if (user != null &&
        user['data'] != null &&
        user['data']['user'] != null &&
        user['data']['user']['id'] != null) {
      return user['data']['user']['id'].toString();
    }
    return '';
  }

  Future<void> saveIsPremium(bool isPremium) async {
    await secureStorage.write(
      key: Pref.isPremium,
      value: isPremium ? "1" : "0",
    );
  }

  Future<bool> isPremiumUser() async {
    String? isPremium = await secureStorage.read(key: Pref.isPremium);
    if (isPremium == "1") return true;

    String? expiryStr = await secureStorage.read(key: Pref.trialExpiryDate);
    if (expiryStr != null) {
      DateTime? expiry = DateTime.tryParse(expiryStr);
      if (expiry != null && DateTime.now().isBefore(expiry)) {
        return true;
      }
    }
    return false;
  }

  Future<void> saveLastPremiumCheck(DateTime date) async {
    await secureStorage.write(
      key: Pref.lastPremiumCheck,
      value: date.toIso8601String(),
    );
  }

  Future<DateTime?> getLastPremiumCheck() async {
    String? dateStr = await secureStorage.read(key: Pref.lastPremiumCheck);
    if (dateStr != null) {
      return DateTime.tryParse(dateStr);
    }
    return null;
  }

  Future<void> saveHasUsedTrial(bool used) async {
    await secureStorage.write(key: Pref.hasUsedTrial, value: used ? "1" : "0");
  }

  Future<bool> hasUsedTrial() async {
    String? used = await secureStorage.read(key: Pref.hasUsedTrial);
    return used == "1";
  }

  Future<void> saveTrialExpiryDate(DateTime date) async {
    await secureStorage.write(
      key: Pref.trialExpiryDate,
      value: date.toIso8601String(),
    );
  }

  Future<DateTime?> getTrialExpiryDate() async {
    String? dateStr = await secureStorage.read(key: Pref.trialExpiryDate);
    if (dateStr != null) {
      return DateTime.tryParse(dateStr);
    }
    return null;
  }

  Future<void> saveSubscriptionExpiryDate(DateTime date) async {
    await secureStorage.write(
      key: Pref.subscriptionExpiryDate,
      value: date.toIso8601String(),
    );
  }

  Future<DateTime?> getSubscriptionExpiryDate() async {
    String? dateStr = await secureStorage.read(
      key: Pref.subscriptionExpiryDate,
    );
    if (dateStr != null) {
      return DateTime.tryParse(dateStr);
    }
    return null;
  }

  Future<void> clearTrialExpiryDate() async {
    await secureStorage.delete(key: Pref.trialExpiryDate);
  }

  Future<void> clearSubscriptionExpiryDate() async {
    await secureStorage.delete(key: Pref.subscriptionExpiryDate);
  }

  Future<void> saveThemeMode(String mode) async {
    await secureStorage.write(key: Pref.themeMode, value: mode);
  }

  Future<String?> getThemeMode() async {
    return await secureStorage.read(key: Pref.themeMode);
  }

  Future<void> saveWidgetThemeMode(String mode) async {
    await secureStorage.write(key: Pref.widgetThemeMode, value: mode);
  }

  Future<String?> getWidgetThemeMode() async {
    return await secureStorage.read(key: Pref.widgetThemeMode);
  }

  Future<void> saveBool(String key, bool value) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  Future<bool?> getBool(String key) async {
    final val = await secureStorage.read(key: key);
    if (val != null) {
      return val == "true";
    }
    return null;
  }
}

class Pref {
  static const String isLoggedIn = "isLoggedIn";
  static const String userData = "userData";
  static const String firstTime = "firstTime";
  static const String userType = "userType";
  static const String journeyMode = "journeyMode";
  static const String city = "city";
  static const String userId = "userId";
  static const String country = "country";
  static const String lat = "lat";
  static const String long = "long";
  static const String isPremium = "isPremium";
  static const String lastPremiumCheck = "lastPremiumCheck";
  static const String hasUsedTrial = "hasUsedTrial";
  static const String trialExpiryDate = "trialExpiryDate";
  static const String subscriptionExpiryDate = "subscriptionExpiryDate";
  static const String themeMode = "themeMode";
  static const String widgetThemeMode = "widgetThemeMode";
  static const String homeWidgetHabitId = "homeWidgetHabitId";
  static const String highlightCurrentDay = "highlightCurrentDay";
  static const String showViewModeBottomBar = "showViewModeBottomBar";
  static const String showCategoryFilter = "showCategoryFilter";
  static const String legacyMode = "legacyMode";
  static const String showStreakCount = "showStreakCount";
  static const String showStreakGoal = "showStreakGoal";
  static const String showCategories = "showCategories";
  static const String showMonthLabels = "showMonthLabels";
  static const String showDayLabels = "showDayLabels";
}
