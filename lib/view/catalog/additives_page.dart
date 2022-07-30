import 'package:bayouni_coffee/controller/catalog_controllers/additives_controller.dart';
import 'package:bayouni_coffee/translations/translation.dart';
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
import '../../model/catalog_product.dart';
import '../../translations/ar.dart';
import '../../translations/en.dart';
import '../widgets/add_notes.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_button.dart';

class AdditivesPage extends StatelessWidget {
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();

  AdditivesPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;
  final additivesController = Get.put(AdditivesController());

  @override
  Widget build(BuildContext context) {
    additivesController.resetProperties();
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
                      AdditivesController.kgPrice.toString() +
                          ' ' +
                          'sr'.tr +
                          ' / ' +
                          'kg'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    Text(
                      Translation.isAr()
                          ? catalogProduct.descAr
                          : catalogProduct.desc,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.radio_button_on_outlined,
                          color: Colors.brown,
                          size: 21,
                        ),
                        SizedBox(width: 5.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Text(
                            'americanCardamim'.tr,
                            style: kTxtStyleNormal,
                          ),
                        ),
                      ],
                    ),
                    aDivider(),
                    Text('type'.tr, style: kTxtStyleNormal),
                    Obx(
                      () => RadioListTile<AdditivesType>(
                        dense: true,
                        title: Text(
                          'beans'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: AdditivesType.beans,
                        groupValue: additivesController.additivesType.value,
                        onChanged: (value) {
                          additivesController.additivesType.value =
                              value ?? AdditivesType.beans;
                          addProductDetails(key: 'type', value: 'beans');
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<AdditivesType>(
                        dense: true,
                        title: Text(
                          'course'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: AdditivesType.ground,
                        groupValue: additivesController.additivesType.value,
                        onChanged: (value) {
                          additivesController.additivesType.value =
                              value ?? AdditivesType.beans;
                          addProductDetails(key: 'type', value: 'course');
                        },
                      ),
                    ),
                    // if (additivesController.additivesType.value ==
                    //     AdditivesType.ground)
                    //   Column(
                    //     children: [
                    //       Obx(
                    //         () => RadioListTile<CoffeeType>(
                    //           contentPadding:
                    //               EdgeInsets.symmetric(horizontal: 35.w),
                    //           dense: true,
                    //           title: Text(
                    //             'Fine (Powder)',
                    //             style: TextStyle(
                    //               fontSize: 13.sp,
                    //             ),
                    //           ),
                    //           value: CoffeeType.fine,
                    //           groupValue: additivesController.coffeeType.value,
                    //           onChanged: (value) {},
                    //         ),
                    //       ),
                    //       Obx(
                    //         () => RadioListTile<CoffeeType>(
                    //           contentPadding:
                    //               EdgeInsets.symmetric(horizontal: 35.w),
                    //           dense: true,
                    //           title: Text(
                    //             'Ground',
                    //             style: TextStyle(
                    //               fontSize: 13.sp,
                    //             ),
                    //           ),
                    //           value: CoffeeType.coarse,
                    //           groupValue: additivesController.coffeeType.value,
                    //           onChanged: (value) {
                    //             additivesController.coffeeType.value =
                    //                 value ?? CoffeeType.fine;
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    aDivider(),
                    QuantityRow(
                      quantity: additivesController.quantity,
                    ),
                    aDivider(),
                    Text(
                      'saffron'.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Obx(
                      () => RadioListTile<SaffronGram>(
                        dense: true,
                        title: Text(
                          '3 ' +
                              'gm'.tr +
                              ' ' +
                              AdditivesController.saffron3GramPrice.toString() +
                              ' ' +
                              'sr'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: SaffronGram.gram3,
                        groupValue: additivesController.saffronGram.value,
                        onChanged: (value) {
                          additivesController.saffronGram.value = value!;
                          addProductDetails(
                            key: en['saffron']!,
                            value: '3 ' +
                                en['gm']! +
                                ' ' +
                                AdditivesController.saffron3GramPrice
                                    .toString() +
                                ' ' +
                                en['sr']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: ar['saffron']!,
                            value: '3 ' +
                                ar['gm']! +
                                ' ' +
                                AdditivesController.saffron3GramPrice
                                    .toString() +
                                ' ' +
                                ar['sr']!,
                            isCustomized: true,
                            isEN: false,
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<SaffronGram>(
                        dense: true,
                        title: Text(
                          '5 ' +
                              'gm'.tr +
                              ' ' +
                              AdditivesController.saffron5GramPrice.toString() +
                              ' ' +
                              'sr'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: SaffronGram.gram5,
                        groupValue: additivesController.saffronGram.value,
                        onChanged: (value) {
                          additivesController.saffronGram.value = value!;
                          addProductDetails(
                            key: en['saffron']!,
                            value: '5 ' +
                                en['gm']! +
                                ' ' +
                                AdditivesController.saffron5GramPrice
                                    .toString() +
                                ' ' +
                                en['sr']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: ar['saffron']!,
                            value: '5 ' +
                                ar['gm']! +
                                ' ' +
                                AdditivesController.saffron5GramPrice
                                    .toString() +
                                ' ' +
                                ar['sr']!,
                            isCustomized: true,
                            isEN: false,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 13.h),
                    aDivider(),
                    SizedBox(height: 13.h),
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
                        print('add clicked');
                        if (catalogProduct.price == 0) {
                          showToast('Please select a product to add');
                          return;
                        }
                        CartProduct cartProduct = CartProduct(
                          name: catalogProduct.name,
                          nameAR: catalogProduct.nameAR,
                          price: additivesController.calculateOrderPrice(
                            quantity: additivesController.quantity.value,
                            saffron: additivesController.saffronGram.value,
                          ),
                          imgURL: catalogProduct.imgThumb,
                          kgQuantity: additivesController.quantity.value,
                          selectedDetails: {...productDetails},
                          selectedDetailsAR: {...productDetailsAR},
                        );
                        showToast('addedToCart'.tr);
                        cartProduct.comments = _commentController.text.trim();
                        cartController.addProductToCart(cartProduct);
                        additivesController.resetProperties();
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
}
