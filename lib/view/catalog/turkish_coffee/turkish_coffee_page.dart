import 'package:bayouni_coffee/controller/catalog_controllers/catalog_fav_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/brazillian_coffee_widget%20copy.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/ethiopian_coffee_widget.dart';
import 'package:bayouni_coffee/view/widgets/fav_catalog_btn.dart';
import 'package:bayouni_coffee/view/widgets/floating_cart.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/catalog_controllers/turkish_controller.dart';
import '../../../utils/constants.dart';

class TurkishCoffeePage extends StatelessWidget {
  TurkishCoffeePage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);

  CatalogProduct catalogProduct;
  final turkishController = Get.put(TurkishController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
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
                    const Text('Back'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: catalogProduct.imgBig,
                    fit: BoxFit.fitWidth,
                  ),
                  // Image.asset('assets/images/catalog_turkish_big.png'),
                  Positioned(
                    right: 0,
                    child: FavCatalogBtn(catalogID: catalogProduct.id),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catalogProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      '${catalogProduct.price} SR',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    Obx(
                      () => RadioListTile<TurkishCoffeeType>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Ethiopian',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: TurkishCoffeeType.ethiopian,
                        groupValue: turkishController.turkishCoffeeType.value,
                        onChanged: (TurkishCoffeeType? value) {
                          turkishController.turkishCoffeeType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<TurkishCoffeeType>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Brazillian',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: TurkishCoffeeType.brazillian,
                        groupValue: turkishController.turkishCoffeeType.value,
                        onChanged: (TurkishCoffeeType? value) {
                          turkishController.turkishCoffeeType.value = value!;
                        },
                      ),
                    ),
                    aDivider(isVerticalPadding: false),
                  ],
                ),
              ),
              Obx(
                () => turkishController.turkishCoffeeType.value ==
                        TurkishCoffeeType.ethiopian
                    ? EthiopianCoffeeWidget(catalogProduct: catalogProduct)
                    : BrazillianCoffeeWidget(catalogProduct: catalogProduct),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }
}
