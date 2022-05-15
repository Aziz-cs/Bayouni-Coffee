import 'package:bayouni_coffee/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controller/helper.dart';
import '../catalog/turkish_coffee/turkish_coffee_page.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.productTitle,
    required this.imgName,
    required this.isFavorite,
    required this.onPress,
  }) : super(key: key);

  final String productTitle;
  final String imgName;
  final bool isFavorite;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: onPress,
              child: Image.asset(
                'assets/images/$imgName.png',
                width: 140.w,
                height: 140.h,
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: Colors.white,
                  size: 29,
                ),
                onPressed: () {
                  showToast('Added to favorites');
                },
              ),
            ),
          ],
        ),
        Text(
          productTitle,
          style: TextStyle(
            color: kDarkGrey,
            fontSize: 14.sp,
          ),
        )
      ],
    );
  }
}
