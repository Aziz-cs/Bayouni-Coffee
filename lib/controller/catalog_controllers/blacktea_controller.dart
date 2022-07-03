import 'package:get/get.dart';

import 'catalog_controller.dart';

enum BlackTeaType { box, bag }

enum GreenTeaType { green, none }

enum ShakerTeaType { shakir, none }

enum OtherTeaType { other, none }

class BlackTeaController extends GetxController {
  static var boxBlackTeaPrice;
  static var bagBlackTeaPrice;
  static var greenTeaPrice;
  static var shakirTeaPrice;

  final blackTeaType = BlackTeaType.box.obs;
  final greenTeaType = GreenTeaType.none.obs;
  final shakerTeaType = ShakerTeaType.none.obs;

  final isBlackTea = true.obs;
  final isGreenTea = false.obs;
  final isShakirTea = false.obs;
  final isOtherTea = false.obs;

  final blackTeaQuanitity = 1.0.obs;
  final greenTeaQuanitity = 1.0.obs;
  final shakirTeaQuanitity = 1.0.obs;
  final Map<String, String> selectedDetails = {};
  final Map<String, String> selectedDetailsAR = {};

  void resetProperties() {
    blackTeaType.value = BlackTeaType.box;
    greenTeaType.value = GreenTeaType.none;
    shakerTeaType.value = ShakerTeaType.none;

    isBlackTea.value = true;
    isGreenTea.value = false;
    isShakirTea.value = false;
    isOtherTea.value = false;

    blackTeaQuanitity.value = 1.0;
    greenTeaQuanitity.value = 1.0;
    shakirTeaQuanitity.value = 1.0;
    selectedDetails.clear();
    selectedDetailsAR.clear();
  }

  static void initBlackTeaPrices() {
    boxBlackTeaPrice = catalogPriceList['blackTea']['boxBlackTeaPrice'];
    bagBlackTeaPrice = catalogPriceList['blackTea']['bagBlackTeaPrice'];
    greenTeaPrice = catalogPriceList['blackTea']['greenTeaPrice'];
    shakirTeaPrice = catalogPriceList['blackTea']['shakirTeaPrice'];
  }

  double calculateOrderPrice() {
    double totalPrice = 0.0;
    if (isBlackTea.value) {
      if (blackTeaType.value == BlackTeaType.box) {
        totalPrice = totalPrice + (boxBlackTeaPrice * blackTeaQuanitity.value);
      } else {
        totalPrice = totalPrice + (bagBlackTeaPrice * blackTeaQuanitity.value);
      }
    }

    if (isGreenTea.value) {
      totalPrice = totalPrice + (greenTeaPrice * greenTeaQuanitity.value);
    }

    if (isShakirTea.value) {
      totalPrice = totalPrice + (shakirTeaPrice * shakirTeaQuanitity.value);
    }
    return totalPrice;
  }
}
