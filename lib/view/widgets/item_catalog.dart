import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/accessory_page.dart';
import 'package:bayouni_coffee/view/catalog/additives_page.dart';
import 'package:bayouni_coffee/view/catalog/arabic_coffee_page.dart';
import 'package:bayouni_coffee/view/catalog/black_tea_page.dart';
import 'package:bayouni_coffee/view/catalog/brewed_page.dart';
import 'package:bayouni_coffee/view/catalog/creamy_page.dart';
import 'package:bayouni_coffee/view/catalog/espresso_page.dart';
import 'package:bayouni_coffee/view/catalog/flavored_coffee_page.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/turkish_coffee_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CatalogItem extends StatelessWidget {
  CatalogItem({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);

  CatalogProduct catalogProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Stack(
        //   children: [
        InkWell(
          onTap: () => pushNewScreen(
            context,
            screen: CatalogController.getCatalogRoutingOf(catalogProduct),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ),
          child: CachedNetworkImage(
            imageUrl: catalogProduct.imgThumb,
            fit: BoxFit.fill,
            height: 140.h,
            width: 140.w,
          ),
        ),
        Text(
          catalogProduct.name,
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
