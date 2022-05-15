import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kArrowColor = Colors.brown;

class MyDropDownMenu extends StatelessWidget {
  MyDropDownMenu({
    required this.value,
    required this.items,
    required this.onChanged,
    this.arrowColor = kArrowColor,
    this.fontSize = 18,
    this.textColor = Colors.black87,
    this.removeUnderLine = false,
    this.removeHeightPadding = false,
  });

  final String value;
  final List<String> items;
  final Function onChanged;
  final textColor;
  final arrowColor;
  double fontSize;
  bool removeUnderLine;
  bool removeHeightPadding;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.brown.shade50,
      iconEnabledColor: arrowColor,
      underline: removeUnderLine
          ? const SizedBox()
          : const Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey,
            ),
      value: value,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              height: removeHeightPadding ? 0.5 : 1.1.h,
            ),
          ),
        );
      }).toList(),
      onChanged: (changedValue) {
        print("Value changed to $changedValue");
      },
    );
  }
}
