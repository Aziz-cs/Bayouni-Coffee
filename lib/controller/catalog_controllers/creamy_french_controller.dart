import 'package:get/get.dart';

import 'catalog_controller.dart';

class CreamyFrenchController extends GetxController {
  static late var kgPrice;
  final quantity = 1.0.obs;
  final Map<String, String> selectedDetails = {};
  final Map<String, String> selectedDetailsAR = {};
  void resetProperties() {
    quantity.value = 1.0;
    selectedDetails.clear();
    selectedDetailsAR.clear();
  }

  static void initCreamyFrenchPrice() {
    kgPrice = catalogPriceList['creamyFrench']['kgPrice'];
  }

  double calculateOrderPrice() {
    return kgPrice * quantity.value;
  }
}
