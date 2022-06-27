import 'dart:ui';

import 'package:bayouni_coffee/utils/shared_prefs.dart';
import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };

  static void switchLang() {
    Get.updateLocale(Get.locale.toString() == 'ar'
        ? const Locale('en')
        : const Locale('ar'));

    sharedPrefs.languageCode = Get.locale.toString();
  }

  static bool isAr() {
    return Get.locale.toString() == 'ar';
  }
}
