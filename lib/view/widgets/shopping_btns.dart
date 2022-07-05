import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../navigator_page.dart';
import 'my_button.dart';

class ShoppingBtns extends StatelessWidget {
  const ShoppingBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 9.h),
        MyButton(
          label: 'continueShopping'.tr,
          onPress: () => Navigator.pop(context),
          isFilled: false,
        ),
        SizedBox(height: 9.h),
        MyButton(
            label: 'checkOut'.tr,
            onPress: () {
              currentTabIndex.value = 2;
              Get.back();
            }),
      ],
    );
  }
}
