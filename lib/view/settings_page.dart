import 'package:bayouni_coffee/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({
    Key? key,
    required this.routedFrom,
  }) : super(key: key);

  String routedFrom;

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
                    routedFrom,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Interface language',
                    style: TextStyle(
                      color: kDarkGrey,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Icon(
                            Icons.check,
                            color: kBeige,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFb7b5b5),
                    height: 0,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arabic",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                        //   child: const Icon(
                        //     Icons.check,
                        //     color: kBeige,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFb7b5b5),
                    height: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
