import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../translations/ar.dart';
import '../../translations/en.dart';
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
  final bDarkRoastPrecentage = "0 %".obs;
  final bMediumRoastPrecentage = "0 %".obs;
  final bLightRoastPrecentage = "0 %".obs;

  final ethiopianCoffeeType = EthiopianCoffeeType.turkish.obs;
  final eQuantity = 1.0.obs;
  final eDarkRoastPrecentage = "0 %".obs;
  final eMediumRoastPrecentage = "0 %".obs;
  final eLightRoastPrecentage = "0 %".obs;

  void resetProperties() {
    turkishCoffeeType.value = TurkishCoffeeType.ethiopian;
    brazillianCoffeeType.value = BrazillianCoffeeType.brazillian;

    bQuantity.value = 1.0;
    bDarkRoastPrecentage.value = "0 %";
    bMediumRoastPrecentage.value = "0 %";
    bLightRoastPrecentage.value = "0 %";

    ethiopianCoffeeType.value = EthiopianCoffeeType.turkish;

    eQuantity.value = 1.0;
    bQuantity.value = 1.0;

    eDarkRoastPrecentage.value = "0 %";
    eMediumRoastPrecentage.value = "0 %";
    eLightRoastPrecentage.value = "0 %";
    productDetails.clear();
    productDetailsAR.clear();
    addProductDetails(key: 'turkishCoffee', value: 'ethiopian');
    addProductDetails(
      key: en['plain']!,
      value: TurkishController.turkishKgPrice.toString() +
          ' ' +
          en['sr']! +
          ' / ' +
          en['kg']!,
      isCustomized: true,
    );
    addProductDetails(
      key: ar['plain']!,
      value: TurkishController.turkishKgPrice.toString() +
          ' ' +
          ar['sr']! +
          ' / ' +
          ar['kg']!,
      isCustomized: true,
      isEN: false,
    );
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
