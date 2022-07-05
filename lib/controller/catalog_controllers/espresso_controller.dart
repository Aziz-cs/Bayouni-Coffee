import 'package:get/get.dart';

import '../cart_controller.dart';
import 'catalog_controller.dart';

enum EspressoType { special, customized }

enum CoffeeType { beans, ground }

enum GroundType { fine, course }

class EspressoController extends GetxController {
  static late var kgPrice;

  final espressoType = EspressoType.special.obs;
  final coffeeType = CoffeeType.beans.obs;
  final groundType = GroundType.fine.obs;
  final isItalianRoast = false.obs;
  final quantity = 1.0.obs;
  final italianRoastPrecentage = "10 %".obs;
  final eDarkRoastPrecentage = "10 %".obs;
  final eMediumRoastPrecentage = "10 %".obs;
  final eLightRoastPrecentage = "10 %".obs;
  final cDarkRoastPrecentage = "10 %".obs;
  final cMediumRoastPrecentage = "10 %".obs;
  final cLightRoastPrecentage = "10 %".obs;

  static void initEspressoPrice() {
    kgPrice = catalogPriceList['espresso']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }

  void resetProperties() {
    espressoType.value = EspressoType.special;
    coffeeType.value = CoffeeType.beans;
    groundType.value = GroundType.fine;
    isItalianRoast.value = false;
    quantity.value = 1.0;
    italianRoastPrecentage.value = "10 %";
    eDarkRoastPrecentage.value = "10 %";
    eMediumRoastPrecentage.value = "10 %";
    eLightRoastPrecentage.value = "10 %";
    cDarkRoastPrecentage.value = "10 %";
    cMediumRoastPrecentage.value = "10 %";
    cLightRoastPrecentage.value = "10 %";
    productDetails.clear();
    productDetailsAR.clear();
    addProductDetails(key: 'product', value: 'specialItalianRoast');
    addProductDetails(key: 'type', value: 'beans');
  }
}
