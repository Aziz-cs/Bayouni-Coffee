import 'package:get/get.dart';

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
  }

  static void initBrewedCoffeePrice() {
    kgPrice = catalogPriceList['brewed']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
