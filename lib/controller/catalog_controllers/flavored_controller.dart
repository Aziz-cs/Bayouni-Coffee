import 'package:get/get.dart';

import 'catalog_controller.dart';

enum FlavoredStyle {
  hazenut,
  frenchVanilla,
  chocolate,
  macadomia,
  almonds,
  caramel,
}

enum GroundType { beans, ground }

enum FlavoredType { fine, course, powder }

class FlavoredController extends GetxController {
  static late var kgPrice;

  final flavoredStyle = FlavoredStyle.hazenut.obs;
  final flavoredType = FlavoredType.fine.obs;
  final groundType = GroundType.beans.obs;
  final quantity = 1.0.obs;
  final Map<String, String> selectedDetails = {};
  final Map<String, String> selectedDetailsAR = {};

  void resetProperties() {
    quantity.value = 1.0;
    flavoredStyle.value = FlavoredStyle.hazenut;
    flavoredType.value = FlavoredType.fine;
    groundType.value = GroundType.beans;
    selectedDetails.clear();
    selectedDetailsAR.clear();
  }

  static void initFlavoredCoffeePrice() {
    kgPrice = catalogPriceList['flavoredCoffee']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
