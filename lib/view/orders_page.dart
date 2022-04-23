import 'package:bayouni_coffee/view/widgets/item_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(CupertinoIcons.back),
                  iconSize: 22,
                  padding: EdgeInsets.only(
                    left: 6.w,
                    right: 3.w,
                    bottom: 6.h,
                    top: 6.h,
                  ),
                  constraints: BoxConstraints(),
                ),
                Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Column(
              children: List.generate(
                2,
                (index) => const OrderItem(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
