import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/start/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/delivery_controller.dart';

class DeliveryPage extends StatelessWidget {
  DeliveryPage({Key? key}) : super(key: key);
  final deliveryController = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          Obx(
            () => RadioListTile<DeliveryWay>(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Delivery',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              value: DeliveryWay.delivery,
              groupValue: deliveryController.deliveryWayType.value,
              onChanged: (DeliveryWay? value) {
                deliveryController.deliveryWayType.value = value!;
              },
            ),
          ),
          Obx(
            () => RadioListTile<DeliveryWay>(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Pick Up',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              value: DeliveryWay.pickup,
              groupValue: deliveryController.deliveryWayType.value,
              onChanged: (DeliveryWay? value) {
                deliveryController.deliveryWayType.value = value!;
              },
            ),
          ),
        ],
      ),
    ));
  }
}
