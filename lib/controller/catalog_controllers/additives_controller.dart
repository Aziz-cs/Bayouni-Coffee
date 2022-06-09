import 'package:get/get.dart';

enum AdditivesType { beans, ground }
enum CoffeeType { fine, coarse }
enum SaffronGram { gram3, gram5 }

class AdditivesController extends GetxController {
  final additivesType = AdditivesType.beans.obs;
  final coffeeType = CoffeeType.fine.obs;
  final saffronGram = SaffronGram.gram3.obs;
  final quantity = 1.0.obs;
}
