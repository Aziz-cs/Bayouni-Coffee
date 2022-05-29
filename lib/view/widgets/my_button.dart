import 'package:bayouni_coffee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.onPress,
    this.isFilled = true,
  }) : super(key: key);
  final String label;
  final VoidCallback onPress;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.fromHeight(48.h)),
        backgroundColor: MaterialStateProperty.all(
          isFilled ? const Color(0xFFC59D5F) : Colors.white,
        ),
        side: MaterialStateProperty.all(const BorderSide(color: kBeige)),
        elevation: MaterialStateProperty.all(isFilled ? 2 : 0),
      ),
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          color: isFilled ? Colors.white : const Color(0xFFC59D5F),
        ),
      ),
    );
  }
}
