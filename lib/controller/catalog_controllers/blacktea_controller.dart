import 'package:get/get.dart';

enum BlackTeaType { box, bag }
enum GreenTeaType { green, none }
enum ShakerTeaType { shakir, none }
enum OtherTeaType { other, none }

class BlackTeaController extends GetxController {
  final blackTeaType = BlackTeaType.box.obs;
  final greenTeaType = GreenTeaType.none.obs;
  final shakerTeaType = ShakerTeaType.none.obs;
  final otherTeaType = OtherTeaType.none.obs;

  final isBlackTea = true.obs;
  final isGreenTea = false.obs;
  final isShakirTea = false.obs;
  final isOtherTea = false.obs;

  final quanitity = 1.0.obs;
}
