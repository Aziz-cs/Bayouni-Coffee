import 'package:bayouni_coffee/controller/cart_controller.dart';
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
    print('brewed has been reset');
    brewedType.value = BrewedType.special;
    coffeeType.value = CoffeeType.beans;
    eDarkRoastPrecentage.value = "10 %";
    eMediumRoastPrecentage.value = "10 %";
    eLightRoastPrecentage.value = "10 %";
    cDarkRoastPrecentage.value = "10 %";
    cMediumRoastPrecentage.value = "10 %";
    cLightRoastPrecentage.value = "10 %";
    quantity.value = 1.0;

    productDetails.clear();
    productDetails.clear();
    addProductDetails(key: 'product', value: 'brewedSpecial');
    addProductDetails(key: 'type', value: 'beans');
  }

  void addToSelectedDetails({
    required String key,
    required String value,
    bool isCustomized = false,
    bool isEN = true,
  }) {
    if (isCustomized && isEN) {
      selectedDetails[key] = value;
    } else if (isCustomized && !isEN) {
      selectedDetailsAR[key] = value;
    } else {
      selectedDetails[en[key]!] = en[value]!;
      selectedDetailsAR[ar[key]!] = ar[value]!;
    }
  }

  static void initBrewedCoffeePrice() {
    kgPrice = catalogPriceList['brewed']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
