import 'package:get/get.dart';

import '../../translations/ar.dart';
import '../../translations/en.dart';
import 'catalog_controller.dart';

enum BrewedType { special, customized }

enum CoffeeType { beans, ground }

class BrewedController extends GetxController {
  static late var kgPrice;

  final brewedType = BrewedType.special.obs;
  final coffeeType = CoffeeType.beans.obs;
  final quantity = 1.0.obs;
  final eDarkRoastPrecentage = "10 %".obs;
  final eMediumRoastPrecentage = "10 %".obs;
  final eLightRoastPrecentage = "10 %".obs;
  final cDarkRoastPrecentage = "10 %".obs;
  final cMediumRoastPrecentage = "10 %".obs;
  final cLightRoastPrecentage = "10 %".obs;
  final Map<String, String> selectedDetails = {};
  final Map<String, String> selectedDetailsAR = {};
  void resetProperties() {
    brewedType.value = BrewedType.special;
    coffeeType.value = CoffeeType.beans;
    eDarkRoastPrecentage.value = "10 %";
    eMediumRoastPrecentage.value = "10 %";
    eLightRoastPrecentage.value = "10 %";
    cDarkRoastPrecentage.value = "10 %";
    cMediumRoastPrecentage.value = "10 %";
    cLightRoastPrecentage.value = "10 %";
    quantity.value = 1.0;
    selectedDetails.clear();
    selectedDetailsAR.clear();
    selectedDetails[en['product']!] = en['brewedSpecial']!;
    selectedDetails[en['type']!] = en['beans']!;
    selectedDetailsAR[ar['product']!] = ar['brewedSpecial']!;
    selectedDetailsAR[ar['type']!] = ar['beans']!;
  }

  static void initBrewedCoffeePrice() {
    kgPrice = catalogPriceList['brewed']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
