import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 60,
            right: 30,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                CupertinoIcons.xmark,
                size: 20,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/thx_top_left.png'),
          ),
          Positioned(
            top: 513.h,
            left: 0,
            child: Image.asset('assets/images/thx_mid_left.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/thx_bot_left.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/thx_bot_right.png'),
          ),
          Positioned(
            top: 88.5.h,
            right: 0,
            child: Image.asset('assets/images/thx_top_right.png'),
          ),
          Positioned.fill(
            top: 262.h,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/bayouni_logo.png',
                  width: 105.w,
                  height: 106.h,
                ),
                SizedBox(height: 18.h),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/thankyou.png',
                    ),
                    Positioned(
                      top: -15.h,
                      child: Text(
                        'For your order',
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: kDarkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "The manager will call you within 30 minutes",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kGrey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
