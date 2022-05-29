import 'package:bayouni_coffee/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/helper.dart';
import 'my_button.dart';

class FavItem extends StatelessWidget {
  FavItem({
    Key? key,
    required this.productTitle,
    required this.productImg,
    required this.productPrice,
  }) : super(key: key);

  final String productTitle;
  final String productImg;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 7.h),
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
                        productImg,
                        height: 120.h,
                      ),
                      SizedBox(height: 3.h),
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
                          productTitle,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.heart_fill,
                              color: kBeige,
                              size: 25,
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 44.w),
                      child: Text(
                        "\$$productPrice",
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          color: kBeige,
                        ),
                      ),
                    ),
                    // SizedBox(height: 6.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: 150.w,
                    //       height: 40.h,
                    //       child: MyButton(
                    //         label: 'ADD TO CART',
                    //         onPress: () => showToast('Added to cart'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 6.h),
                  ],
                ),
              ),
            ],
          ),
          // const Divider(
          //   color: kGrey,
          //   height: 1,
          // ),
        ],
      ),
    );
  }
}
