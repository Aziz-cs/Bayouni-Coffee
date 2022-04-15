import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.onPress,
  }) : super(key: key);
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.fromHeight(48.h)),
        backgroundColor: MaterialStateProperty.all(const Color(0xFFC59D5F)),
      ),
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
