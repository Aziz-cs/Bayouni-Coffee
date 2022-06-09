import 'package:get/get.dart';

enum TurkishCoffeeType { ethiopian, brazillian }
enum BrazillianCoffeeType { brazillian, brazillianCardamom }
enum EthiopianCoffeeType { turkish, turkishCardamom }

class TurkishController extends GetxController {
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
}
