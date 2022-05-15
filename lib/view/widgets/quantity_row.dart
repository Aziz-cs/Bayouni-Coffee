import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class QuantityRow extends StatefulWidget {
  QuantityRow({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  int quantity;

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
                  setState(() {
                    widget.quantity++;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.add,
                  size: 20,
                )),
            Container(
              width: 40.w,
              height: 30.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black45,
                  width: 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${widget.quantity}',
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
                      widget.quantity--;
                    });
                  }
                },
                icon: const Icon(
                  CupertinoIcons.minus,
                  size: 20,
                )),
            SizedBox(width: 5.w),
            Text('KG', style: kTxtStyleNormal),
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
