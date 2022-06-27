import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/accessory_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AccessoryItem extends StatelessWidget {
  AccessoryItem({
    Key? key,
    required this.accessory,
  }) : super(key: key);

  AccessoryProduct accessory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Stack(
        //   children: [
        InkWell(
          onTap: () => pushNewScreen(
            context,
            screen: AccessoryProductPage(
              routedFrom: 'accessories'.tr,
              accessoryProduct: accessory,
            ),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ),
          child: CachedNetworkImage(
            imageUrl: accessory.imgURL,
            fit: BoxFit.fill,
            height: 100.h,
            width: 100.w,
          ),
        ),
        Text(
          Translation.isAr() ? accessory.nameAR : accessory.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kDarkGrey,
            fontSize: 14.sp,
          ),
        )
      ],
    );
  }
}
