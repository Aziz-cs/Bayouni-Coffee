import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

// SharedPreferences Keys
  static const String keyUsername = "userName";
  static const String keyPhoneNo = "phoneNo";
  static const String keyImageURL = "imageURL";

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get userName => _sharedPrefs!.getString(keyUsername) ?? "";
  String get phoneNo => _sharedPrefs!.getString(keyPhoneNo) ?? "";
  String get imageURL => _sharedPrefs!.getString(keyImageURL) ?? "";

  set userName(String value) {
    _sharedPrefs!.setString(keyUsername, value);
  }

  set phoneNo(String value) {
    _sharedPrefs!.setString(keyPhoneNo, value);
  }

  set imageURL(String value) {
    _sharedPrefs!.setString(keyImageURL, value);
  }

  static void clearData() {
    _sharedPrefs!.clear();
  }
}

final sharedPrefs = SharedPrefs();
