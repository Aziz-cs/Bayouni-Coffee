import 'package:get/get.dart';

enum EspressoType { special, customized }
enum CoffeeType { beans, ground }
enum GroundType { fine, course }

class EspressoController extends GetxController {
  final espressoType = EspressoType.special.obs;
  final coffeeType = CoffeeType.beans.obs;
  final groundType = GroundType.fine.obs;
  final isItalianRoast = false.obs;
  final quantity = 1.0.obs;
  final italianRoastPrecentage = "10 %".obs;
  final eDarkRoastPrecentage = "10 %".obs;
  final eMediumRoastPrecentage = "10 %".obs;
  final eLightRoastPrecentage = "10 %".obs;
  final cDarkRoastPrecentage = "10 %".obs;
  final cMediumRoastPrecentage = "10 %".obs;
  final cLightRoastPrecentage = "10 %".obs;
}
