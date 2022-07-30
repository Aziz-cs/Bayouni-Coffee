import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:bayouni_coffee/controller/catalog_controllers/brewed_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/helper.dart';
import '../../model/cart_product.dart';
import '../../translations/ar.dart';
import '../../translations/en.dart';
import '../../utils/constants.dart';
import '../widgets/add_notes.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_button.dart';
import '../widgets/my_drop_menu.dart';

class BrewedPage extends StatelessWidget {
  BrewedPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;
  final brewedController = Get.put(BrewedController());

  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    brewedController.resetProperties();
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
                      BrewedController.kgPrice.toString() +
                          ' ' +
                          'sr'.tr +
                          ' / ' +
                          'kg'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    aDivider(),
                    Obx(
                      () => RadioListTile<BrewedType>(
                        dense: true,
                        title: Text(
                          'brewedSpecial'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'brewedSpecialSubTitle'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        value: BrewedType.special,
                        groupValue: brewedController.brewedType.value,
                        onChanged: (value) {
                          brewedController.brewedType.value = value!;
                          addProductDetails(
                              key: 'product', value: 'brewedSpecial');
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<BrewedType>(
                        dense: true,
                        title: Text(
                          'brewedCustomize'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: BrewedType.customized,
                        groupValue: brewedController.brewedType.value,
                        onChanged: (value) {
                          brewedController.brewedType.value = value!;
                          addProductDetails(
                              key: 'product', value: 'brewedCustomize');
                        },
                      ),
                    ),
                    Obx(
                      () => brewedController.brewedType.value ==
                              BrewedType.special
                          ? _buildSpecialBrewedOrder()
                          : _buildCustomizedBrewedOrder(),
                    ),
                  ],
                ),
              ),
              AddNotesTextField(commentController: _commentController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    MyButton(
                      label: 'addToCart'.tr,
                      onPress: () {
                        if (catalogProduct.price == 0) {
                          showToast('Please select a product to add');
                          return;
                        }
                        CartProduct cartProduct = CartProduct(
                          name: catalogProduct.name,
                          nameAR: catalogProduct.nameAR,
                          price: brewedController.calculateOrderPrice(),
                          imgURL: catalogProduct.imgThumb,
                          kgQuantity: brewedController.quantity.value,
                          selectedDetails: {...productDetails},
                          selectedDetailsAR: {...productDetailsAR},
                        );
                        showToast('addedToCart'.tr);
                        cartProduct.comments = _commentController.text.trim();
                        cartController.addProductToCart(cartProduct);
                        brewedController.resetProperties();
                        _commentController.clear();
                      },
                    ),
                    SizedBox(height: 10.h),
                    MyButton(
                      label: 'continueShopping'.tr,
                      onPress: () => Navigator.pop(context),
                      isFilled: false,
                    ),
                  ],
                ),
              ),
              // Obx(
              //   () => ShoppingButtons(
              //     cartProduct: CartProduct(
              //       name: catalogProduct.name,
              //       nameAR: catalogProduct.nameAR,
              //       price: brewedController.calculateOrderPrice(),
              //       imgURL: catalogProduct.imgThumb,
              //       kgQuantity: brewedController.quantity.value,
              //       selectedDetails: {...productDetails},
              //       selectedDetailsAR: {...productDetailsAR},
              //       // selectedDetails: {...brewedController.selectedDetails},
              //       // selectedDetailsAR: {...brewedController.selectedDetailsAR},
              //     ),
              //   ),
              // ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }

  Column _buildCustomizedBrewedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text('brewedCustomizeSubTitle'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.red.shade700,
                  )),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            const Expanded(
                child: Divider(
              color: Colors.grey,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('ethiopianPrecentage'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                  )),
            ),
            const Expanded(
                child: Divider(
              color: Colors.grey,
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'darkRoast'.tr,
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: brewedController.eDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eDarkRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['ethiopian']! + ' ' + en['darkRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['ethiopian']! + ' ' + ar['darkRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
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
                value: brewedController.eMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eMediumRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['ethiopian']! + ' ' + en['mediumRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['ethiopian']! + ' ' + ar['mediumRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
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
                value: brewedController.eLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eLightRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['ethiopian']! + ' ' + en['lightRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['ethiopian']! + ' ' + ar['lightRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
                child: Divider(
              color: Colors.grey,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('colombianPrecentage'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                  )),
            ),
            const Expanded(
                child: Divider(
              color: Colors.grey,
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'darkRoast'.tr,
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: brewedController.cDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.cDarkRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['colombian']! + ' ' + en['darkRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['colombian']! + ' ' + ar['darkRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
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
                value: brewedController.cMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.cMediumRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['colombian']! + ' ' + en['mediumRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['colombian']! + ' ' + ar['mediumRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
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
                value: brewedController.cLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.cLightRoastPrecentage.value = val!;
                  addProductDetails(
                    key: en['colombian']! + ' ' + en['lightRoast']!,
                    value: val,
                    isCustomized: true,
                  );

                  addProductDetails(
                    key: ar['colombian']! + ' ' + ar['lightRoast']!,
                    value: val,
                    isCustomized: true,
                    isEN: false,
                  );
                },
              ),
            ),
          ],
        ),
        aDivider(),
        Text('type'.tr, style: kTxtStyleNormal),
        Obx(
          () => RadioListTile<CoffeeType>(
            dense: true,
            title: Text(
              'beans'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: CoffeeType.beans,
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
              addProductDetails(key: 'type', value: 'beans');
            },
          ),
        ),
        Obx(
          () => RadioListTile<CoffeeType>(
            dense: true,
            title: Text(
              'ground'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: CoffeeType.ground,
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              print('changed to ground');
              brewedController.coffeeType.value = value!;
              addProductDetails(key: 'type', value: 'ground');
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: brewedController.quantity),
      ],
    );
  }

  Column _buildSpecialBrewedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('type'.tr, style: kTxtStyleNormal),
        Obx(
          () => RadioListTile<CoffeeType>(
            dense: true,
            title: Text(
              'beans'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: CoffeeType.beans,
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
              addProductDetails(key: 'type', value: 'beans');
            },
          ),
        ),
        Obx(
          () => RadioListTile<CoffeeType>(
            dense: true,
            title: Text(
              'ground'.tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: CoffeeType.ground,
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              print('added ground');
              brewedController.coffeeType.value = value!;
              addProductDetails(key: 'type', value: 'ground');
              print(brewedController.selectedDetails);
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: brewedController.quantity),
      ],
    );
  }
}
