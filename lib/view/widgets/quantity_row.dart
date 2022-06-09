import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class QuantityRow extends StatelessWidget {
  QuantityRow({
    Key? key,
    required this.quantity,
    this.mesurementUnit = 'KG',
    this.isFractioned = true,
  }) : super(key: key);

  RxDouble quantity;
  String mesurementUnit;
  bool isFractioned;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quantity',
          style: kTxtStyleNormal,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  if (quantity.value >= 1000) {
                    return;
                  }
                  if (isFractioned) {
                    quantity.value = quantity.value + 0.5;
                  } else {
                    quantity.value++;
                  }
                },
                icon: const Icon(
                  CupertinoIcons.add,
                  size: 20,
                )),
            Container(
              width: 55.w,
              height: 23.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black45,
                  width: 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  isFractioned
                      ? quantity.toString()
                      : quantity.toInt().toString(),
                  // '${widget.quantity.toString().characters.last == '0' ? widget.quantity.toString().characters.first : widget.quantity}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (quantity.value > 0) {
                    if (isFractioned) {
                      quantity.value = quantity.value - 0.5;
                    } else {
                      quantity.value--;
                    }
                  }
                },
                icon: const Icon(
                  CupertinoIcons.minus,
                  size: 20,
                )),
            SizedBox(width: 5.w),
            Text(
              mesurementUnit,
              style: kTxtStyleNormal,
            ),
            SizedBox(width: 5.w),
            const Icon(
              Icons.radio_button_checked,
              size: 18,
              color: Colors.brown,
            )
          ],
        ),
      ],
    );
  }
}
