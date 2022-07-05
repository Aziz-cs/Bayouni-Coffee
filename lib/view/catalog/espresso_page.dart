import 'package:bayouni_coffee/controller/catalog_controllers/espresso_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
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
import '../widgets/shopping_btns.dart';

class EspressoPage extends StatelessWidget {
  CatalogProduct catalogProduct;
  final espressoController = Get.put(EspressoController());
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();

  EspressoPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    espressoController.resetProperties();
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
                      EspressoController.kgPrice.toString() + ' SR / KG',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    aDivider(),
                    Obx(
                      () => RadioListTile<EspressoType>(
                        dense: true,
                        title: Text(
                          'espressoSpecial'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'recommended'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        value: EspressoType.special,
                        groupValue: espressoController.espressoType.value,
                        onChanged: (value) {
                          espressoController.espressoType.value = value!;
                          espressoController.coffeeType.value =
                              CoffeeType.beans;
                          removeProductDetails(key: 'ground');
                          addProductDetails(
                              key: 'product', value: 'specialItalianRoast');
                          addProductDetails(key: 'type', value: 'beans');
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<EspressoType>(
                        dense: true,
                        title: Text(
                          'espressoCustomize'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: EspressoType.customized,
                        groupValue: espressoController.espressoType.value,
                        onChanged: (value) {
                          espressoController.espressoType.value = value!;
                          espressoController.coffeeType.value =
                              CoffeeType.beans;
                          removeProductDetails(key: 'ground');
                          addProductDetails(
                              key: 'product', value: 'brewedCustomize');
                          addProductDetails(key: 'type', value: 'beans');
                        },
                      ),
                    ),
                    Obx(() => espressoController.espressoType.value ==
                            EspressoType.customized
                        ? _buildCustomizedEspressoOrder()
                        : const SizedBox()),
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
                        groupValue: espressoController.coffeeType.value,
                        onChanged: (value) {
                          espressoController.coffeeType.value = value!;
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
                        groupValue: espressoController.coffeeType.value,
                        onChanged: (value) {
                          espressoController.coffeeType.value = value!;
                          espressoController.groundType.value = GroundType.fine;
                          addProductDetails(key: 'type', value: 'ground');
                          addProductDetails(key: 'ground', value: 'fine');
                        },
                      ),
                    ),
                    Obx(() => espressoController.coffeeType.value ==
                            CoffeeType.ground
                        ? Column(
                            children: [
                              RadioListTile<GroundType>(
                                dense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 35.w),
                                title: Text(
                                  'fine'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  'fineSubTitle'.tr,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                ),
                                value: GroundType.fine,
                                groupValue: espressoController.groundType.value,
                                onChanged: (value) {
                                  espressoController.groundType.value = value!;
                                  addProductDetails(
                                      key: 'ground', value: 'fine');
                                },
                              ),
                              Obx(
                                () => RadioListTile<GroundType>(
                                  dense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 35.w),
                                  title: Text(
                                    'course'.tr,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'courseEspressoSubTitle'.tr,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  value: GroundType.course,
                                  groupValue:
                                      espressoController.groundType.value,
                                  onChanged: (value) {
                                    espressoController.groundType.value =
                                        value!;
                                    addProductDetails(
                                        key: 'ground', value: 'course');
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox()),

                    aDivider(),
                    QuantityRow(
                      quantity: espressoController.quantity,
                    ),
                    // ? _buildSpecialEspressoOrder()
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
                            price: espressoController.calculateOrderPrice(),
                            imgURL: catalogProduct.imgThumb,
                            kgQuantity: espressoController.quantity.value,
                            selectedDetails: {...productDetails},
                            selectedDetailsAR: {...productDetailsAR});
                        showToast('addedToCart'.tr);
                        cartProduct.comments = _commentController.text.trim();
                        cartController.addProductToCart(cartProduct);
                        espressoController.resetProperties();
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

  Column _buildCustomizedEspressoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text('espressoCustomizeSubTitle'.tr,
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
            Obx(
              () => Checkbox(
                  value: espressoController.isItalianRoast.value,
                  onChanged: (_) {
                    espressoController.isItalianRoast.value =
                        !espressoController.isItalianRoast.value;
                    if (isDetailIsAdded(key: 'italian')) {
                      removeProductDetails(key: 'italian');
                      removeProductDetails(key: 'specialItalianRoast');
                    } else {
                      addProductDetails(
                          key: 'italian', value: 'specialItalianRoast');
                    }
                  }),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'italian'.tr,
                  style: kTxtStyleNormal,
                ),
                Text(
                  'specialItalianRoast'.tr,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Obx(
              () => espressoController.isItalianRoast.value
                  ? MyDropDownMenu(
                      value: espressoController.italianRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        espressoController.italianRoastPrecentage.value = val!;
                        addProductDetails(
                          key: 'specialItalianRoast',
                          value: val,
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        SizedBox(height: 10.h),
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
                value: espressoController.eDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eDarkRoastPrecentage.value = val!;
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
                value: espressoController.eMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eMediumRoastPrecentage.value = val!;
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
                value: espressoController.eLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eLightRoastPrecentage.value = val!;
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
                value: espressoController.cDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cDarkRoastPrecentage.value = val!;
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
                value: espressoController.cMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cMediumRoastPrecentage.value = val!;
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
                value: espressoController.cLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cLightRoastPrecentage.value = val!;
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
      ],
    );
  }
}
