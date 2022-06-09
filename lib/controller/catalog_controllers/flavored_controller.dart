import 'package:get/get.dart';

enum FlavoredStyle {
  hazenut,
  frenchVanilla,
  chocolate,
  macadomia,
  almonds,
  caramel,
}
enum GroundType { beans, ground }
enum FlavoredType { fine, course, powder }

class FlavoredController extends GetxController {
  final flavoredStyle = FlavoredStyle.hazenut.obs;
  final flavoredType = FlavoredType.fine.obs;
  final groundType = GroundType.beans.obs;
  final quantity = 1.0.obs;
}
