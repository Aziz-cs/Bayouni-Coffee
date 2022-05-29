import 'package:bayouni_coffee/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  CartItem({Key? key}) : super(key: key);

  RxInt quanitiy = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 15.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120.w,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/product_item1.png',
                        height: 120.h,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () => quanitiy.value++,
                              icon: const Icon(
                                CupertinoIcons.add,
                                size: 19,
                              )),
                          Obx(
                            () => Text(
                              quanitiy.value.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                if (quanitiy.value > 1) {
                                  quanitiy.value--;
                                }
                              },
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 19,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Manual Espresso / Cappuccino",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.xmark,
                              size: 17,
                            ))
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.only(right: 44.w),
                      child: Text(
                        "Good quality black Kenyan, continue for a big description",
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          color: kGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: kGrey,
            height: 1,
          ),
          SizedBox(height: 13.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VAT Included',
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
              )
            ],
          ),
          SizedBox(height: 13.h),
        ],
      ),
    );
  }
}
