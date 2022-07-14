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
  final eDarkRoastPrecentage = "0 %".obs;
  final eMediumRoastPrecentage = "0 %".obs;
  final eLightRoastPrecentage = "0 %".obs;
  final cDarkRoastPrecentage = "0 %".obs;
  final cMediumRoastPrecentage = "0 %".obs;
  final cLightRoastPrecentage = "0 %".obs;
  final Map<String, String> selectedDetails = {};
  final Map<String, String> selectedDetailsAR = {};
  void resetProperties() {
    print('brewed has been reset');
    brewedType.value = BrewedType.special;
    coffeeType.value = CoffeeType.beans;
    eDarkRoastPrecentage.value = "0 %";
    eMediumRoastPrecentage.value = "0 %";
    eLightRoastPrecentage.value = "0 %";
    cDarkRoastPrecentage.value = "0 %";
    cMediumRoastPrecentage.value = "0 %";
    cLightRoastPrecentage.value = "0 %";
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
