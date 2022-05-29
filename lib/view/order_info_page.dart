import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/item_order.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfoPage extends StatelessWidget {
  const OrderInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                    constraints: const BoxConstraints(),
                  ),
                  Text(
                    "My orders",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            const OrderItem(),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.delivery_dining_sharp,
                        color: kGrey,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(color: kGrey),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.info_circle,
                          color: kGrey,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Information about delivery',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      SizedBox(
                        height: 210.h,
                        child: ListView(
                          children: [
                            _buildInfoItem(
                                title: 'Delivery method',
                                subtitle: 'Pickup from our store'),
                            _buildInfoItem(
                                title: 'Delivery address',
                                subtitle: 'Prince Sultan Street (A/1)'),
                            _buildInfoItem(
                                title: 'Recipient', subtitle: 'Muhammad Aziz'),
                            _buildInfoItem(
                                title: 'Phone recipient',
                                subtitle: '966 12 34 5678901'),
                            _buildInfoItem(
                                title: 'Payment method',
                                subtitle: 'Cash at the time of pickup'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: kGrey),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: kGrey,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "Total price",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Text(
                        "\$76",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  MyButton(
                    label: 'CONTINUE SHOPPING',
                    onPress: () {},
                    isFilled: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildInfoItem({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12.sp,
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
