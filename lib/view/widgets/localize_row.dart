import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocalizeRow extends StatelessWidget {
  const LocalizeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Get.locale.toString() == 'en' ? 'عربي' : 'English',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          Get.locale.toString() == 'en' ? '🇸🇦' : '🇱🇷',
          style: TextStyle(
            fontSize: 23.sp,
          ),
        ),
      ],
    );
  }
}
