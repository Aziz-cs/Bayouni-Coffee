import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bayouni_coffee/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.iconData,
    required this.hintText,
    this.isPrefixIcon = true,
  }) : super(key: key);

  final IconData iconData;
  final String hintText;
  final bool isPrefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43.h,
      margin: EdgeInsets.only(bottom: 16.h),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: isPrefixIcon
                ? Icon(
                    iconData,
                    color: kGrey,
                  )
                : const SizedBox(),
            suffixIcon: isPrefixIcon
                ? const SizedBox()
                : Icon(
                    iconData,
                    color: kGrey,
                  ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
              borderSide: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1.0,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: kGrey,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.h)),
      ),
    );
  }
}
