import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:get/get.dart';

enum CoffeeType { specialBlend, customize }
enum BlendType { beans, ground }
enum BlendTense { fine, medium, course }

class ArabicCoffeeController extends GetxController {
  static late var specialBlendPrice;
  static late var customizeBlendPrice;
  static late var saffron3GramPrice;

  final coffeeType = CoffeeType.specialBlend.obs;
  final blendType = BlendType.beans.obs;
  final blendTense = BlendTense.fine.obs;
  final isSaffron = false.obs;
  final quantity = 1.0.obs;
  final darkRoastPrecentage = "10 %".obs;
  final mediumRoastPrecentage = "10 %".obs;
  final lightRoastPrecentage = "10 %".obs;

  static void initArabicCoffeePrice() {
    specialBlendPrice = catalogPriceList['arabicCoffee']['specialBlend'];
    customizeBlendPrice = catalogPriceList['arabicCoffee']['customizeBlend'];
    saffron3GramPrice = catalogPriceList['arabicCoffee']['saffron3Gram'];
  }

  double calculateOrderPrice({
    required double quantity,
    required CoffeeType coffeeType,
    required bool isSaffronAdded,
  }) {
    print('quantity $quantity');
    var kgPrice;
    switch (coffeeType) {
      case CoffeeType.specialBlend:
        kgPrice = specialBlendPrice;
        break;
      case CoffeeType.customize:
        kgPrice = customizeBlendPrice;
        break;
    }

    double orderPrice =
        (kgPrice * quantity) + (isSaffronAdded ? saffron3GramPrice : 0);
    print('order price: $orderPrice');
    return orderPrice;
  }

  void resetProperties() {
    coffeeType.value = CoffeeType.specialBlend;
    blendType.value = BlendType.beans;
    blendTense.value = BlendTense.fine;
    isSaffron.value = false;
    quantity.value = 1.0;
    darkRoastPrecentage.value = "10 %";
    mediumRoastPrecentage.value = "10 %";
    lightRoastPrecentage.value = "10 %";
  }
}
