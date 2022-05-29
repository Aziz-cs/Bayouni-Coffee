import 'package:get/get.dart';

enum BrewedType { special, customized }
enum CoffeeType { beans, ground }

class BrewedController extends GetxController {
  final brewedType = BrewedType.special.obs;
  final coffeeType = CoffeeType.beans.obs;
  final quantity = 1.0.obs;
  final eDarkRoastPrecentage = "10 %".obs;
  final eMediumRoastPrecentage = "10 %".obs;
  final eLightRoastPrecentage = "10 %".obs;
  final cDarkRoastPrecentage = "10 %".obs;
  final cMediumRoastPrecentage = "10 %".obs;
  final cLightRoastPrecentage = "10 %".obs;
}
