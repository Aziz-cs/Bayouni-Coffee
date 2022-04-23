import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/order_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreen(
        context,
        screen: const OrderInfoPage(),
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Black Tea750 (1 box)",
              style: TextStyle(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order № 721 483 598',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  '09.02.22',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: kGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Image.asset(
              'assets/images/order_item1.png',
              width: 120,
            ),
            SizedBox(height: 16.h),
            const Divider(color: kGrey),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paid: VAT Included',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  '\$76',
                  style: TextStyle(
                    color: kBeige,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
