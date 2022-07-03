import 'package:bayouni_coffee/controller/catalog_controllers/creamy_french_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/cart_product.dart';
import '../../translations/translation.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';

class CreamyPage extends StatelessWidget {
  CreamyPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;
  final creamyFrenchController = Get.put(CreamyFrenchController());

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
                    Text('back'.tr),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: catalogProduct.imgBig,
                    fit: BoxFit.fill,
                  ),
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
                      Translation.isAr()
                          ? catalogProduct.nameAR
                          : catalogProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      CreamyFrenchController.kgPrice.toString() +
                          ' ' +
                          'sr'.tr +
                          ' / ' +
                          'kg'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'creamyFrenchSubTitle1'.tr,
                            style: TextStyle(
                              fontSize: 14.5.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'creamyFrenchSubTitle2'.tr,
                            style: TextStyle(
                              fontSize: 14.5.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    aDivider(),
                    QuantityRow(
                      quantity: creamyFrenchController.quantity,
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              Obx(
                () => ShoppingButtons(
                  cartProduct: CartProduct(
                    name: catalogProduct.name,
                    nameAR: catalogProduct.nameAR,
                    price: creamyFrenchController.calculateOrderPrice(),
                    imgURL: catalogProduct.imgThumb,
                    kgQuantity: creamyFrenchController.quantity.value,
                    selectedDetails: {
                      ...creamyFrenchController.selectedDetails
                    },
                    selectedDetailsAR: {
                      ...creamyFrenchController.selectedDetailsAR
                    },
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }
}
