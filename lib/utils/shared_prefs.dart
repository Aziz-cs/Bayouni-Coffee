import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

// SharedPreferences Keys
  static const String keyUsername = "userName";
  static const String keyPhoneNo = "phoneNo";
  static const String keyCityName = "cityName";
  static const String keyDistrictName = "districtName";
  static const String keyImageURL = "imageURL";
  static const String keyLanguageCode = "languageCode";

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get userName => _sharedPrefs!.getString(keyUsername) ?? "";
  String get phoneNo => _sharedPrefs!.getString(keyPhoneNo) ?? "";
  String get imageURL => _sharedPrefs!.getString(keyImageURL) ?? "";
  String get cityName => _sharedPrefs!.getString(keyCityName) ?? "";
  String get districtName => _sharedPrefs!.getString(keyDistrictName) ?? "";
  String get languageCode => _sharedPrefs!.getString(keyLanguageCode) ?? "en";

  set userName(String value) {
    _sharedPrefs!.setString(keyUsername, value);
  }

  set phoneNo(String value) {
    _sharedPrefs!.setString(keyPhoneNo, value);
  }

  set cityName(String value) {
    _sharedPrefs!.setString(keyCityName, value);
  }

  set districtName(String value) {
    _sharedPrefs!.setString(keyDistrictName, value);
  }

  set imageURL(String value) {
    _sharedPrefs!.setString(keyImageURL, value);
  }

  set languageCode(String value) {
    _sharedPrefs!.setString(keyLanguageCode, value);
  }

  static void clearData() {
    _sharedPrefs!.clear();
  }
}

final sharedPrefs = SharedPrefs();
