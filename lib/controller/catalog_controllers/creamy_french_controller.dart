import 'package:get/get.dart';

import 'catalog_controller.dart';

class CreamyFrenchController extends GetxController {
  static late var kgPrice;
  final quantity = 1.0.obs;

  void resetProperties() {
    quantity.value = 1.0;
  }

  static void initCreamyFrenchPrice() {
    kgPrice = catalogPriceList['creamyFrench']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
