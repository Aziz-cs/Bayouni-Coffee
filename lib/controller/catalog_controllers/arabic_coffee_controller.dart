import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:get/get.dart';

enum CoffeeType { specialBlend, customize }
enum BlendType { beans, ground }
enum BlendTense { fine, medium, course }

class ArabicCoffeController extends GetxController {
  final coffeeType = CoffeeType.specialBlend.obs;
  final blendType = BlendType.beans.obs;
  final blendTense = BlendTense.fine.obs;
  final isSaffron = false.obs;
  final quantity = 1.0.obs;
  final darkRoastPrecentage = "10 %".obs;
  final mediumRoastPrecentage = "10 %".obs;
  final lightRoastPrecentage = "10 %".obs;
}
