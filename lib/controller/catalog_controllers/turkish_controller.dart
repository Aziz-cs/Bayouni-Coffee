import 'package:get/get.dart';

import 'catalog_controller.dart';

enum TurkishCoffeeType { ethiopian, brazillian }
enum BrazillianCoffeeType { brazillian, brazillianCardamom }
enum EthiopianCoffeeType { turkish, turkishCardamom }

class TurkishController extends GetxController {
  static late var turkishKgPrice;
  static late var turkishCardamomKgPrice;
  static late var brazillianKgPrice;
  static late var brazillianCardamomKgPrice;

  final turkishCoffeeType = TurkishCoffeeType.ethiopian.obs;

  final brazillianCoffeeType = BrazillianCoffeeType.brazillian.obs;
  final bQuantity = 0.5.obs;
  final bDarkRoastPrecentage = "10 %".obs;
  final bMediumRoastPrecentage = "10 %".obs;
  final bLightRoastPrecentage = "10 %".obs;

  final ethiopianCoffeeType = EthiopianCoffeeType.turkish.obs;
  final eQuantity = 1.0.obs;

  final eDarkRoastPrecentage = "10 %".obs;
  final eMediumRoastPrecentage = "10 %".obs;
  final eLightRoastPrecentage = "10 %".obs;

  void resetProperties() {
    turkishCoffeeType.value = TurkishCoffeeType.ethiopian;
    brazillianCoffeeType.value = BrazillianCoffeeType.brazillian;

    bQuantity.value = 1.0;
    bDarkRoastPrecentage.value = "10 %";
    bMediumRoastPrecentage.value = "10 %";
    bLightRoastPrecentage.value = "10 %";

    ethiopianCoffeeType.value = EthiopianCoffeeType.turkish;

    eQuantity.value = 1.0;
    bQuantity.value = 1.0;

    eDarkRoastPrecentage.value = "10 %";
    eMediumRoastPrecentage.value = "10 %";
    eLightRoastPrecentage.value = "10 %";
  }

  static void initTurkishCoffeePrice() {
    turkishKgPrice = catalogPriceList['turkishCoffee']['turkish'];
    turkishCardamomKgPrice =
        catalogPriceList['turkishCoffee']['turkishCardamom'];
    brazillianKgPrice = catalogPriceList['turkishCoffee']['brazillian'];
    brazillianCardamomKgPrice =
        catalogPriceList['turkishCoffee']['brazillianCardamom'];
  }

  double calculateOrderPrice({
    required TurkishCoffeeType coffeeType,
    BrazillianCoffeeType brazillianCoffeeType = BrazillianCoffeeType.brazillian,
    EthiopianCoffeeType ethiopianCoffeeType = EthiopianCoffeeType.turkish,
  }) {
    if (coffeeType == TurkishCoffeeType.ethiopian) {
      switch (ethiopianCoffeeType) {
        case EthiopianCoffeeType.turkish:
          return turkishKgPrice * eQuantity.value;
        case EthiopianCoffeeType.turkishCardamom:
          return turkishCardamomKgPrice * eQuantity.value;
        default:
      }
    } else if (coffeeType == TurkishCoffeeType.brazillian) {
      switch (brazillianCoffeeType) {
        case BrazillianCoffeeType.brazillian:
          return brazillianKgPrice * bQuantity.value;
        case BrazillianCoffeeType.brazillianCardamom:
          return brazillianCardamomKgPrice * bQuantity.value;
        default:
      }
    }
    return 0;
  }
}
