import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class QuantityRow extends StatefulWidget {
  QuantityRow({
    Key? key,
    required this.quantity,
    this.mesurementUnit = 'KG',
    this.isFractioned = true,
  }) : super(key: key);

  double quantity;
  String mesurementUnit;
  bool isFractioned;
  @override
  State<QuantityRow> createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {
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
                  if (widget.quantity >= 1000) {
                    return;
                  }
                  setState(() {
                    if (widget.isFractioned) {
                      widget.quantity = widget.quantity + 0.5;
                    } else {
                      widget.quantity++;
                    }
                  });
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
              child: Text(
                widget.isFractioned
                    ? widget.quantity.toString()
                    : widget.quantity.toInt().toString(),
                // '${widget.quantity.toString().characters.last == '0' ? widget.quantity.toString().characters.first : widget.quantity}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 15.sp,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (widget.quantity > 0) {
                    setState(() {
                      if (widget.isFractioned) {
                        widget.quantity = widget.quantity - 0.5;
                      } else {
                        widget.quantity--;
                      }
                    });
                  }
                },
                icon: const Icon(
                  CupertinoIcons.minus,
                  size: 20,
                )),
            SizedBox(width: 5.w),
            Text(
              widget.mesurementUnit,
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
