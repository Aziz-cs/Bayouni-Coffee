import 'package:bayouni_coffee/controller/catalog_controllers/blacktea_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
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

import '../../controller/cart_controller.dart';
import '../../model/cart_product.dart';
import '../../translations/ar.dart';
import '../../translations/en.dart';
import '../../utils/constants.dart';
import '../widgets/add_notes.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_button.dart';
import '../widgets/shopping_btns.dart';

class BlackTeaPage extends StatelessWidget {
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();
  BlackTeaPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  final CatalogProduct catalogProduct;
  final blackTeaController = Get.put(BlackTeaController());
  @override
  Widget build(BuildContext context) {
    blackTeaController.resetProperties();
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
                    aDivider(),
                    Obx(
                      () => CheckboxListTile(
                        tileColor: blackTeaController.isBlackTea.isTrue
                            ? Colors.brown.shade50
                            : Colors.white,
                        value: blackTeaController.isBlackTea.value,
                        onChanged: (value) {
                          blackTeaController.isBlackTea.value =
                              !blackTeaController.isBlackTea.value;
                          print('isBlackTea');
                          print(blackTeaController.isBlackTea.value);

                          if (blackTeaController.isBlackTea.isFalse) {
                            blackTeaController.blackTeaType.value =
                                BlackTeaType.none;
                            if (value == false) {
                              removeProductDetails(key: 'bayouniBlackTea');
                              removeProductDetails(key: 'bayouniBlackTeaType');
                            }
                          }
                        },
                        title: Text(
                          'bayouniBlackTea'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        subtitle: Text(
                          'bayouniBlackTeaSubTitle'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => blackTeaController.isBlackTea.isTrue
                          ? Column(
                              children: [
                                Obx(
                                  () => RadioListTile<BlackTeaType>(
                                    dense: true,
                                    title: Text(
                                      'blackTeaBox'.tr,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    subtitle: Text(
                                      BlackTeaController.boxBlackTeaPrice
                                              .toString() +
                                          ' ' +
                                          'sr'.tr,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    value: BlackTeaType.box,
                                    groupValue:
                                        blackTeaController.blackTeaType.value,
                                    onChanged: (value) {
                                      blackTeaController.blackTeaType.value =
                                          value ?? BlackTeaType.box;
                                    },
                                  ),
                                ),
                                Obx(
                                  () => RadioListTile<BlackTeaType>(
                                    dense: true,
                                    title: Text(
                                      'blackTeaBag'.tr,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    subtitle: Text(
                                      BlackTeaController.bagBlackTeaPrice
                                              .toString() +
                                          ' ' +
                                          'sr'.tr,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    value: BlackTeaType.bag,
                                    groupValue:
                                        blackTeaController.blackTeaType.value,
                                    onChanged: (value) {
                                      blackTeaController.blackTeaType.value =
                                          value ?? BlackTeaType.box;
                                    },
                                  ),
                                ),
                                Obx(
                                  () => QuantityRow(
                                    quantity:
                                        blackTeaController.blackTeaQuanitity,
                                    isFractioned: false,
                                    mesurementUnit:
                                        blackTeaController.blackTeaType.value ==
                                                BlackTeaType.box
                                            ? 'box'.tr
                                            : 'bag'.tr,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    aDivider(),
                    Obx(
                      () => CheckboxListTile(
                        tileColor: blackTeaController.isGreenTea.isTrue
                            ? Colors.brown.shade50
                            : Colors.white,
                        value: blackTeaController.isGreenTea.value,
                        onChanged: (value) {
                          blackTeaController.isGreenTea.value =
                              !blackTeaController.isGreenTea.value;
                          // if (isDetailIsAdded(key: 'greenTea')) {
                          //   removeProductDetails(key: 'greenTea');
                          // } else {}
                        },
                        title: Text(
                          'greenTea'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          BlackTeaController.greenTeaPrice.toString() +
                              ' ' +
                              'sr'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => blackTeaController.isGreenTea.isTrue
                          ? QuantityRow(
                              quantity: blackTeaController.greenTeaQuanitity,
                            )
                          : const SizedBox(),
                    ),
                    aDivider(),
                    Obx(
                      () => CheckboxListTile(
                        tileColor: blackTeaController.isShakirTea.isTrue
                            ? Colors.brown.shade50
                            : Colors.white,
                        value: blackTeaController.isShakirTea.value,
                        onChanged: (value) {
                          blackTeaController.isShakirTea.value =
                              !blackTeaController.isShakirTea.value;
                          // if (isDetailIsAdded(key: 'shakirTea')) {
                          //   removeProductDetails(key: 'shakirTea');
                          // } else {
                          //   addProductDetails(key: 'shakirTea', value: 'pc');
                          // }
                        },
                        title: Text(
                          'shakirTea'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          BlackTeaController.shakirTeaPrice.toString() +
                              ' ' +
                              'sr'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => blackTeaController.isShakirTea.isTrue
                          ? QuantityRow(
                              quantity: blackTeaController.shakirTeaQuanitity,
                              isFractioned: false,
                              mesurementUnit: 'pc'.tr,
                            )
                          : const SizedBox(),
                    ),
                    aDivider(),
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
                        if (blackTeaController.isBlackTea.isTrue) {
                          addProductDetails(
                            key: 'bayouniBlackTea'.tr,
                            value:
                                '${blackTeaController.blackTeaQuanitity.value} ' +
                                    en['kg']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: 'bayouniBlackTea'.tr,
                            value:
                                '${blackTeaController.blackTeaQuanitity.value} ' +
                                    ar['kg']!,
                            isCustomized: true,
                            isEN: false,
                          );

                          addProductDetails(
                            key: 'bayouniBlackTeaType',
                            value: blackTeaController.blackTeaType.value ==
                                    BlackTeaType.box
                                ? 'box'
                                : 'bag',
                          );
                        }
                        if (blackTeaController.isGreenTea.isTrue) {
                          addProductDetails(
                            key: 'greenTea'.tr,
                            value:
                                '${blackTeaController.greenTeaQuanitity.value} ' +
                                    en['kg']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: 'greenTea'.tr,
                            value:
                                '${blackTeaController.greenTeaQuanitity.value} ' +
                                    ar['kg']!,
                            isCustomized: true,
                            isEN: false,
                          );
                        }
                        if (blackTeaController.isShakirTea.isTrue) {
                          addProductDetails(
                            key: 'shakirTea'.tr,
                            value:
                                '${blackTeaController.shakirTeaQuanitity.value} ' +
                                    en['pc']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: 'shakirTea'.tr,
                            value:
                                '${blackTeaController.shakirTeaQuanitity.value} ' +
                                    ar['pc']!,
                            isCustomized: true,
                            isEN: false,
                          );
                        }
                        if (blackTeaController.calculateOrderPrice() == 0.0) {
                          showToast('errSelectProduct'.tr);
                          return;
                        }
                        CartProduct cartProduct = CartProduct(
                          name: catalogProduct.name,
                          nameAR: catalogProduct.nameAR,
                          price: blackTeaController.calculateOrderPrice(),
                          imgURL: catalogProduct.imgThumb,
                          selectedDetails: {...productDetails},
                          selectedDetailsAR: {...productDetailsAR},
                        );
                        showToast('addedToCart'.tr);
                        cartProduct.comments = _commentController.text.trim();
                        cartController.addProductToCart(cartProduct);
                        blackTeaController.resetProperties();
                        _commentController.clear();
                      },
                    ),
                    const ShoppingBtns(),
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
