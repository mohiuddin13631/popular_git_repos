import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../environment.dart';


class SharedPreferenceService {
  // Define keys as constants
  static const String accessTokenKey = 'access_token';
  static const String accessTokenType = 'access_type';
  static const String resetPassTokenKey = 'reset_pass_token';
  static const String userEmailKey = 'user_email';
  static const String userNameKey = 'user_name';
  static const String userBalanceKey = 'user_balance';
  static const String userPinCodeKey = 'user_pin_code';
  static const String userPhoneNumberKey = 'user_phone_number';
  static const String userFullNameKey = 'user_full_name';
  static const String userImageKey = 'user_image_path';
  static const String rememberMeKey = 'remember_me';
  static const String isLoggedIn = 'is_logged_in';
  static const String onboardKey = 'onboard_status';
  static const String generalSettingKey = 'general-setting-key';
  static const String moduleSettingKey = 'module-setting-key';
  static const String fcmDeviceKey = 'device-key';
  static const String needTwoFactorVerification = 'need-tfa';
  static const String userIdKey = 'user_id';
  static const String hasNewNotificationKey = 'new-notification-key';
  static const String theme = 'theme';
  static const String token = 'token';
  static const String countryJsonData = 'country_json_data';
  static const String countryCode = 'country_code';
  static const String languageImagePath = 'language_image_path';
  static const String languageCode = 'language_code';
  static const String languageKey = 'language-key';
  static const String languageListKey = 'language-list-key';
  static const String biometricEnabledKey = 'is_biometric_enabled';
  static const String selectedOperatingCountryKey = 'selected-operating-country-key';

  static SharedPreferences? _prefs;
  static final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Initialize SharedPreferences instance
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Returns true if the persistent storage contains the given [key].
  static bool containsKey(String key, {bool defaultValue = false}) {
    return _prefs?.containsKey(key) ?? defaultValue;
  }

  /// Save a string value to SharedPreferences
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Get a string value from SharedPreferences
  static String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  /// Save a boolean value to SharedPreferences
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// Get a boolean value from SharedPreferences
  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  /// Save an integer value to SharedPreferences
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// Get an integer value from SharedPreferences
  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  /// Remove a key from SharedPreferences
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Store a JSON object (e.g., General Setting) to SharedPreferences
  static Future<void> setJsonObject(
    String key,
    Map<String, dynamic> jsonObject,
  ) async {
    String jsonString = jsonEncode(jsonObject);
    await _prefs?.setString(key, jsonString);
  }

  /// Retrieve a JSON object from SharedPreferences
  static Map<String, dynamic> getJsonObject(String key) {
    String? jsonString = _prefs?.getString(key);
    return jsonString != null ? jsonDecode(jsonString) : {};
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
    preferencesKeyPrefix: Environment.appName,
  );
  static IOSOptions _getIOsOptions() => const IOSOptions(accessibility: KeychainAccessibility.unlocked);

  /// Example methods to store and retrieve specific data using predefined  keys
  static Future<void> setAccessToken(String token) async {
    await setString(accessTokenKey, token);
  }

  static String getAccessToken() {
    return getString(accessTokenKey);
  }

  static Future<void> setUserEmail(String email) async {
    await setString(userEmailKey, email);
  }

  static String getUserEmail() {
    return getString(userEmailKey);
  }

  static Future<void> setUserName(String name) async {
    await setString(userNameKey, name);
  }

  static String getUserImage() {
    return getString(userImageKey);
  }

  static String getUserName() {
    return getString(userNameKey);
  }

  static String getUserFullName() {
    return getString(userFullNameKey);
  }

  static String getUserPhoneNumber() {
    return getString(userPhoneNumberKey);
  }

  static Future<String?> getUserPinNumber() async {
    return await _secureStorage.read(
      key: userPinCodeKey,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOsOptions(),
    );
  }

  static Future setUserPinNumber(String value) async {
    await _secureStorage.write(
      key: userPhoneNumberKey,
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOsOptions(),
    );
  }

  static Future<String?> getUserBalance() async {
    return await _secureStorage.read(
      key: userBalanceKey,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOsOptions(),
    );
  }

  static Future setUserBalance(String value) async {
    await _secureStorage.write(
      key: userBalanceKey,
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOsOptions(),
    );
  }

  static Future<void> setRememberMe(bool rememberMe) async {
    await setBool(rememberMeKey, rememberMe);
  }

  static bool getRememberMe() {
    return getBool(rememberMeKey);
  }

  static Future<void> setIsLoggedIn(bool value) async {
    await setBool(isLoggedIn, value);
  }

  static bool getIsLoggedIn() {
    return getBool(isLoggedIn);
  }

  static Future<void> setNotificationStatus(bool value) async {
    await setBool(hasNewNotificationKey, value);
  }

  static bool getNotificationStatus() {
    return getBool(hasNewNotificationKey);
  }

  static Future<void> setBioMetricStatus(bool value) async {
    await setBool(biometricEnabledKey, value);
  }

  static bool getBioMetricStatus() {
    return getBool(biometricEnabledKey);
  }

  static Future<void> setOnBoardStatus(bool value) async {
    await setBool(onboardKey, value);
  }

  // You can add similar methods for other keys as needed.
}
