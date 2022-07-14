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
  final italianRoastPrecentage = "0 %".obs;
  final eDarkRoastPrecentage = "0 %".obs;
  final eMediumRoastPrecentage = "0 %".obs;
  final eLightRoastPrecentage = "0 %".obs;
  final cDarkRoastPrecentage = "0 %".obs;
  final cMediumRoastPrecentage = "0 %".obs;
  final cLightRoastPrecentage = "0 %".obs;

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
    italianRoastPrecentage.value = "0 %";
    eDarkRoastPrecentage.value = "0 %";
    eMediumRoastPrecentage.value = "0 %";
    eLightRoastPrecentage.value = "0 %";
    cDarkRoastPrecentage.value = "0 %";
    cMediumRoastPrecentage.value = "0 %";
    cLightRoastPrecentage.value = "0 %";
    productDetails.clear();
    productDetailsAR.clear();
    addProductDetails(key: 'product', value: 'specialItalianRoast');
    addProductDetails(key: 'type', value: 'beans');
  }
}
