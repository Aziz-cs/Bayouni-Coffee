import 'package:bayouni_coffee/controller/catalog_controllers/flavored_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../controller/helper.dart';
import '../../model/cart_product.dart';
import '../../translations/translation.dart';
import '../widgets/add_notes.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_button.dart';

class FlavoredCoffeePage extends StatelessWidget {
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();
  FlavoredCoffeePage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;
  final flavoredController = Get.put(FlavoredController());

  @override
  Widget build(BuildContext context) {
    flavoredController.resetProperties();
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
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      FlavoredController.kgPrice.toString() +
                          ' ' +
                          'sr'.tr +
                          ' / ' +
                          'kg'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    _buildRadioTileFlavored(
                      title: 'hazenut'.tr,
                      flavoredStyle: FlavoredStyle.hazenut,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(key: 'product', value: 'hazenut');
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'frenchVanilla'.tr,
                      flavoredStyle: FlavoredStyle.frenchVanilla,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(
                            key: 'product', value: 'frenchVanilla');
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'chocolate'.tr,
                      flavoredStyle: FlavoredStyle.chocolate,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(key: 'product', value: 'chocolate');
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'macadomia'.tr,
                      flavoredStyle: FlavoredStyle.macadomia,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(key: 'product', value: 'macadomia');
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'almonds'.tr,
                      flavoredStyle: FlavoredStyle.almonds,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(key: 'product', value: 'almonds');
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'caramel'.tr,
                      flavoredStyle: FlavoredStyle.caramel,
                      onPress: (value) {
                        flavoredController.flavoredStyle.value = value!;
                        addProductDetails(key: 'product', value: 'caramel');
                      },
                    ),
                    aDivider(),
                    Text('type'.tr, style: kTxtStyleNormal),
                    Obx(
                      () => RadioListTile<GroundType>(
                        dense: true,
                        title: Text(
                          'beans'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: GroundType.beans,
                        groupValue: flavoredController.groundType.value,
                        onChanged: (value) {
                          flavoredController.groundType.value = value!;
                          addProductDetails(key: 'type', value: 'beans');
                          removeProductDetails(key: 'ground');
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<GroundType>(
                        dense: true,
                        title: Text(
                          'ground'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: GroundType.ground,
                        groupValue: flavoredController.groundType.value,
                        onChanged: (value) {
                          flavoredController.groundType.value = value!;
                          addProductDetails(key: 'type', value: 'ground');
                          addProductDetails(key: 'ground', value: 'fine');
                        },
                      ),
                    ),
                    Obx(
                      () => flavoredController.groundType.value ==
                              GroundType.ground
                          ? Column(
                              children: [
                                Obx(
                                  () => RadioListTile<FlavoredType>(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 35.w),
                                    dense: true,
                                    title: Text(
                                      'fine'.tr,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    subtitle: Text('turkishCoffee'.tr),
                                    value: FlavoredType.fine,
                                    groupValue:
                                        flavoredController.flavoredType.value,
                                    onChanged: (value) {
                                      flavoredController.flavoredType.value =
                                          value!;
                                      addProductDetails(
                                          key: 'ground', value: 'fine');
                                    },
                                  ),
                                ),
                                Obx(
                                  () => RadioListTile<FlavoredType>(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 35.w),
                                    dense: true,
                                    title: Text(
                                      'lightPowder'.tr,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    subtitle: Text('espressoMachine'.tr),
                                    value: FlavoredType.powder,
                                    groupValue:
                                        flavoredController.flavoredType.value,
                                    onChanged: (value) {
                                      flavoredController.flavoredType.value =
                                          value!;
                                      addProductDetails(
                                          key: 'ground', value: 'lightPowder');
                                    },
                                  ),
                                ),
                                Obx(
                                  () => RadioListTile<FlavoredType>(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 35.w),
                                    dense: true,
                                    title: Text(
                                      'course'.tr,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    subtitle: Text('brewedCoffee'.tr),
                                    value: FlavoredType.course,
                                    groupValue:
                                        flavoredController.flavoredType.value,
                                    onChanged: (value) {
                                      flavoredController.flavoredType.value =
                                          value!;
                                      addProductDetails(
                                          key: 'ground', value: 'course');
                                    },
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    QuantityRow(
                      quantity: flavoredController.quantity,
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
                          price: flavoredController.calculateOrderPrice(),
                          imgURL: catalogProduct.imgThumb,
                          kgQuantity: flavoredController.quantity.value,
                          selectedDetails: {...productDetails},
                          selectedDetailsAR: {...productDetailsAR},
                        );
                        showToast('addedToCart'.tr);
                        cartProduct.comments = _commentController.text.trim();
                        cartController.addProductToCart(cartProduct);
                        flavoredController.resetProperties();
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
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }

  Widget _buildRadioTileFlavored({
    required String title,
    required FlavoredStyle flavoredStyle,
    required Function(FlavoredStyle?) onPress,
  }) {
    return Obx(
      () => RadioListTile<FlavoredStyle>(
        dense: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        value: flavoredStyle,
        groupValue: flavoredController.flavoredStyle.value,
        onChanged: onPress,
      ),
    );
  }
}
