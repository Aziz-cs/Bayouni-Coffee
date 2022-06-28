import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/translations/translation.dart';
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
import '../../controller/catalog_controllers/arabic_coffee_controller.dart';
import '../../model/cart_product.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_drop_menu.dart';

class SaudiCoffeePage extends StatelessWidget {
  SaudiCoffeePage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  final arabicCoffeeController = Get.put(ArabicCoffeeController());
  CatalogProduct catalogProduct;
  @override
  Widget build(BuildContext context) {
    arabicCoffeeController.resetProperties();
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
                    // Text(
                    //   '${catalogProduct.price} SR',
                    //   style: TextStyle(
                    //     fontSize: 16.sp,
                    //     color: kBeige,
                    //   ),
                    // ),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'specialBlend'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          ArabicCoffeeController.specialBlendPrice.toString() +
                              ' ' +
                              'sr'.tr +
                              ' / ' +
                              'kg'.tr,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        value: CoffeeType.specialBlend,
                        groupValue: arabicCoffeeController.coffeeType.value,
                        onChanged: (value) {
                          arabicCoffeeController.coffeeType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'customize'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'makeYourOwnBlend'.tr +
                              ' \n' +
                              ArabicCoffeeController.customizeBlendPrice
                                  .toString() +
                              ' ' +
                              'sr'.tr +
                              ' / ' +
                              'kg'.tr,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        isThreeLine: true,
                        value: CoffeeType.customize,
                        groupValue: arabicCoffeeController.coffeeType.value,
                        onChanged: (value) {
                          arabicCoffeeController.coffeeType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => arabicCoffeeController.coffeeType.value ==
                              CoffeeType.specialBlend
                          ? _buildSpecialArabicOrder()
                          : _buildCustomizedArabicOrder(),
                    ),
                  ],
                ),
              ),
              Obx(
                () => ShoppingButtons(
                  cartProduct: CartProduct(
                    name: catalogProduct.name,
                    nameAR: catalogProduct.nameAR,
                    price: arabicCoffeeController.calculateOrderPrice(
                      quantity: arabicCoffeeController.quantity.value,
                      coffeeType: arabicCoffeeController.coffeeType.value,
                      isSaffronAdded: arabicCoffeeController.isSaffron.value,
                    ),
                    imgURL: catalogProduct.imgThumb,
                    kgQuantity: arabicCoffeeController.quantity.value,
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

  Column _buildCustomizedArabicOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'customize'.tr,
          style: kTxtStyleNormal,
        ),
        Text(
          'makeYourOwnBlend'.tr,
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'darkRoast'.tr,
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: arabicCoffeeController.darkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.darkRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'mediumRoast'.tr,
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: arabicCoffeeController.mediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.mediumRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'lightRoast'.tr,
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: arabicCoffeeController.lightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.lightRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        aDivider(),
        QuantityRow(quantity: arabicCoffeeController.quantity),
        aDivider(),
        Text('type'.tr, style: kTxtStyleNormal),
        Obx(
          () => RadioListTile<BlendType>(
            dense: true,
            title: Text(
              'beans'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: BlendType.beans,
            groupValue: arabicCoffeeController.blendType.value,
            onChanged: (value) {
              arabicCoffeeController.blendType.value = value!;
            },
          ),
        ),
        Obx(
          () => RadioListTile<BlendType>(
            dense: true,
            title: Text(
              'ground'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: BlendType.ground,
            groupValue: arabicCoffeeController.blendType.value,
            onChanged: (value) {
              arabicCoffeeController.blendType.value = value!;
            },
          ),
        ),
        if (arabicCoffeeController.blendType.value == BlendType.ground)
          Column(
            children: [
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'fine'.tr,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.fine,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'medium'.tr,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.medium,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'course'.tr,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.course,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
            ],
          ),
        aDivider(),
        Text(
          'additionalOption'.tr,
          style: kTxtStyleNormal,
        ),
        Obx(
          () => CheckboxListTile(
            title: Text(
              'addSaffron'.tr,
              style: kTxtStyleNormal,
            ),
            subtitle: Text(
              ArabicCoffeeController.saffron3GramPrice.toString() +
                  ' ' +
                  'sr'.tr +
                  ' / ' +
                  '3' +
                  ' ' +
                  'gm'.tr,
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            value: arabicCoffeeController.isSaffron.value,
            onChanged: (value) {
              arabicCoffeeController.isSaffron.value =
                  !arabicCoffeeController.isSaffron.value;
            },
          ),
        ),
      ],
    );
  }

  Column _buildSpecialArabicOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'specialBlend'.tr,
          style: kTxtStyleNormal,
        ),
        Text(
          'specialBlendSubTitle'.tr,
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        Obx(
          () => CheckboxListTile(
            title: Text(
              'addSaffron'.tr,
              style: kTxtStyleNormal,
            ),
            subtitle: Text(
              ArabicCoffeeController.saffron3GramPrice.toString() +
                  ' ' +
                  'sr'.tr +
                  ' / ' +
                  '3' +
                  ' ' +
                  'gm'.tr,
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            value: arabicCoffeeController.isSaffron.value,
            onChanged: (value) {
              arabicCoffeeController.isSaffron.value =
                  !arabicCoffeeController.isSaffron.value;
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: arabicCoffeeController.quantity),
      ],
    );
  }
}
