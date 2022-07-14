import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../translations/ar.dart';
import '../../translations/en.dart';
import 'catalog_controller.dart';

enum BlackTeaType { box, bag, none }

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
    productDetails.clear();
    productDetailsAR.clear();
    addProductDetails(
      key: en['bayouniBlackTea']!,
      value: blackTeaQuanitity.value.toString() + ' ' + en['kg']!,
      isCustomized: true,
    );
    addProductDetails(
      key: ar['bayouniBlackTea']!,
      value: blackTeaQuanitity.value.toString() + ' ' + ar['kg']!,
      isCustomized: true,
      isEN: false,
    );
    addProductDetails(key: 'bayouniBlackTeaType', value: 'box');
  }

  static void initBlackTeaPrices() {
    boxBlackTeaPrice = catalogPriceList['blackTea']['boxBlackTeaPrice'];
    bagBlackTeaPrice = catalogPriceList['blackTea']['bagBlackTeaPrice'];
    greenTeaPrice = catalogPriceList['blackTea']['greenTeaPrice'];
    shakirTeaPrice = catalogPriceList['blackTea']['shakirTeaPrice'];
  }

  double calculateOrderPrice() {
    double totalPrice = 0.0;
    print('isBlackTea ${isBlackTea.value}');
    print('isGreenTea ${isGreenTea.value}');
    print('isShakirTea ${isShakirTea.value}');
    if (isBlackTea.isTrue) {
      if (blackTeaType.value == BlackTeaType.box) {
        totalPrice = totalPrice + (boxBlackTeaPrice * blackTeaQuanitity.value);
      } else if (blackTeaType.value == BlackTeaType.bag) {
        totalPrice = totalPrice + (bagBlackTeaPrice * blackTeaQuanitity.value);
      } else {
        totalPrice = 0.0;
      }
    }
    print('total price after blacktea = $totalPrice');

    if (isGreenTea.isTrue) {
      totalPrice = totalPrice + (greenTeaPrice * greenTeaQuanitity.value);
    }

    if (isShakirTea.isTrue) {
      totalPrice = totalPrice + (shakirTeaPrice * shakirTeaQuanitity.value);
    }

    print('total price after all = $totalPrice');
    return totalPrice;
  }
}
