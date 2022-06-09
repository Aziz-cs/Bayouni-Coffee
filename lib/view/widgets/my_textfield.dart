import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bayouni_coffee/utils/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.iconData,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isPrefixIcon = true,
    this.textInputType = TextInputType.text,
    this.isObscure = false,
    this.onChanged,
  }) : super(key: key);

  final IconData iconData;
  final String hintText;
  final bool isPrefixIcon;
  final bool isObscure;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: isObscure,
        controller: controller,
        keyboardType: textInputType,
        validator: validator,
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
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: kGrey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
    );
  }
}
