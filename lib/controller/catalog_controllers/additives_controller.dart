import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:get/get.dart';

enum AdditivesType { beans, ground }
enum CoffeeType { fine, coarse }
enum SaffronGram { gram3, gram5, none }

class AdditivesController extends GetxController {
  static late double kgPrice;
  static late double saffron3GramPrice;
  static late double saffron5GramPrice;

  final additivesType = AdditivesType.beans.obs;
  final coffeeType = CoffeeType.fine.obs;
  final saffronGram = SaffronGram.none.obs;
  final quantity = 1.0.obs;

  static void initAdditivesPrices() {
    kgPrice = (catalogPriceList['additives']['kgPrice'] as int).toDouble();
    saffron3GramPrice = catalogPriceList['additives']['saffron3Gram'];
    saffron5GramPrice = catalogPriceList['additives']['saffron5Gram'];
    print('price of Additives kgPrice = $kgPrice');
    print('price of saffrom3GramPrice = $saffron3GramPrice');
    print('price of saffrom5GramPrice  = $saffron5GramPrice');
  }

  double calculateOrderPrice({
    required double quantity,
    required SaffronGram saffron,
  }) {
    print('quantity $quantity');
    print('SaffronGram $saffron');
    double saffronPrice;
    switch (saffron) {
      case SaffronGram.none:
        saffronPrice = 0.0;
        break;
      case SaffronGram.gram3:
        saffronPrice = saffron3GramPrice;
        break;
      case SaffronGram.gram5:
        saffronPrice = saffron5GramPrice;
        break;
    }

    print('total = ${(kgPrice * quantity) + saffronPrice}');

    return (kgPrice * quantity) + saffronPrice;
  }

  void resetProperties() {
    saffronGram.value = SaffronGram.none;
    quantity.value = 1.0;
  }
}
