import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget aDivider({bool isVerticalPadding = true}) {
  return Column(
    children: [
      SizedBox(height: isVerticalPadding ? 5.h : 0),
      const Divider(
        indent: 13,
        endIndent: 13,
        thickness: 0.8,
        height: 0,
      ),
      SizedBox(height: isVerticalPadding ? 5.h : 0),
    ],
  );
}
