import 'package:get/get.dart';

enum DeliveryWay { delivery, pickup }

class DeliveryController extends GetxController {
  final deliveryWayType = DeliveryWay.delivery.obs;
}
