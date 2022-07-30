import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/view/widgets/fav_catalog_btn.dart';
import 'package:bayouni_coffee/view/widgets/floating_cart.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/catalog_controllers/turkish_controller.dart';
import '../../controller/helper.dart';
import '../../model/cart_product.dart';
import '../../translations/ar.dart';
import '../../translations/en.dart';
import '../../utils/constants.dart';
import '../widgets/add_notes.dart';
import '../widgets/my_button.dart';
import '../widgets/my_drop_menu.dart';
import '../widgets/quantity_row.dart';

class TurkishCoffeePage extends StatelessWidget {
  final turkishController = Get.put(TurkishController());
  final ethiopianController = Get.find<TurkishController>();
  final brazillianController = Get.find<TurkishController>();
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();
  TurkishCoffeePage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);

  CatalogProduct catalogProduct;

  @override
  Widget build(BuildContext context) {
    turkishController.resetProperties();
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
                      Translation.isAr()
                          ? catalogProduct.nameAR
                          : catalogProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Obx(
                      () => RadioListTile<TurkishCoffeeType>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'ethiopian'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: TurkishCoffeeType.ethiopian,
                        groupValue: turkishController.turkishCoffeeType.value,
                        onChanged: (TurkishCoffeeType? value) {
                          turkishController.turkishCoffeeType.value = value!;
                          turkishController.resetProperties();
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<TurkishCoffeeType>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'brazillian'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: TurkishCoffeeType.brazillian,
                        groupValue: turkishController.turkishCoffeeType.value,
                        onChanged: (TurkishCoffeeType? value) {
                          turkishController.turkishCoffeeType.value = value!;
                          removeProductDetails(key: 'plain');
                          addProductDetails(
                              key: 'turkishCoffee', value: 'brazillian');

                          addProductDetails(
                            key: en['plain']!,
                            value:
                                TurkishController.brazillianKgPrice.toString() +
                                    ' ' +
                                    en['sr']! +
                                    ' / ' +
                                    en['kg']!,
                            isCustomized: true,
                          );
                          addProductDetails(
                            key: ar['plain']!,
                            value:
                                TurkishController.brazillianKgPrice.toString() +
                                    ' ' +
                                    ar['sr']! +
                                    ' / ' +
                                    ar['kg']!,
                            isCustomized: true,
                            isEN: false,
                          );
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
                    ? _buildEthiopianChoices(context)
                    : _buildBrazillianChoices(context),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }

  Column _buildBrazillianChoices(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => RadioListTile<BrazillianCoffeeType>(
                  dense: true,
                  title: Text(
                    'plain'.tr,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    TurkishController.brazillianKgPrice.toString() +
                        ' ' +
                        'sr'.tr +
                        ' / ' +
                        'kg'.tr,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: BrazillianCoffeeType.brazillian,
                  groupValue: brazillianController.brazillianCoffeeType.value,
                  onChanged: (BrazillianCoffeeType? value) {
                    brazillianController.brazillianCoffeeType.value = value!;
                    removeProductDetails(key: 'withCardamom');
                    addProductDetails(
                      key: en['plain']!,
                      value: TurkishController.brazillianKgPrice.toString() +
                          ' ' +
                          en['sr']! +
                          ' / ' +
                          en['kg']!,
                      isCustomized: true,
                    );
                    addProductDetails(
                      key: ar['plain']!,
                      value: TurkishController.brazillianKgPrice.toString() +
                          ' ' +
                          ar['sr']! +
                          ' / ' +
                          ar['kg']!,
                      isCustomized: true,
                      isEN: false,
                    );
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BrazillianCoffeeType>(
                  dense: true,
                  title: Text(
                    'withCardamom'.tr,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    TurkishController.brazillianCardamomKgPrice.toString() +
                        ' ' +
                        'sr'.tr +
                        ' / ' +
                        'kg'.tr,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: BrazillianCoffeeType.brazillianCardamom,
                  groupValue: brazillianController.brazillianCoffeeType.value,
                  onChanged: (BrazillianCoffeeType? value) {
                    brazillianController.brazillianCoffeeType.value = value!;
                    removeProductDetails(key: 'plain');
                    addProductDetails(
                      key: en['withCardamom']!,
                      value: TurkishController.brazillianCardamomKgPrice
                              .toString() +
                          ' ' +
                          en['sr']! +
                          ' / ' +
                          en['kg']!,
                      isCustomized: true,
                    );
                    addProductDetails(
                      key: ar['withCardamom']!,
                      value: TurkishController.brazillianCardamomKgPrice
                              .toString() +
                          ' ' +
                          ar['sr']! +
                          ' / ' +
                          ar['kg']!,
                      isCustomized: true,
                      isEN: false,
                    );
                  },
                ),
              ),
              aDivider(isVerticalPadding: false),
              SizedBox(height: 8.h),
              Text(
                'customizeBlend'.tr,
                style: TextStyle(
                  fontSize: 17.sp,
                ),
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
                      value: brazillianController.bDarkRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        brazillianController.bDarkRoastPrecentage.value = val!;
                        addProductDetails(
                          key: en['darkRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['darkRoast']!,
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
                      value: brazillianController.bMediumRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        brazillianController.bMediumRoastPrecentage.value =
                            val!;
                        addProductDetails(
                          key: en['mediumRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['mediumRoast']!,
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
                      value: brazillianController.bLightRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        brazillianController.bLightRoastPrecentage.value = val!;
                        addProductDetails(
                          key: en['lightRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['lightRoast']!,
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
              QuantityRow(
                quantity: brazillianController.bQuantity,
              ),
              SizedBox(height: 10.h),
              aDivider(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        AddNotesTextField(commentController: _commentController),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      price: turkishController.calculateOrderPrice(
                        coffeeType: turkishController.turkishCoffeeType.value,
                        brazillianCoffeeType:
                            brazillianController.brazillianCoffeeType.value,
                      ),
                      imgURL: catalogProduct.imgThumb,
                      kgQuantity: brazillianController.bQuantity.value,
                      selectedDetails: {...productDetails},
                      selectedDetailsAR: {...productDetailsAR});
                  showToast('addedToCart'.tr);
                  cartProduct.comments = _commentController.text.trim();
                  cartController.addProductToCart(cartProduct);
                  brazillianController.resetProperties();
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
        //         name: catalogProduct.name,
        //         nameAR: catalogProduct.nameAR,
        //         price: catalogProduct.price,
        //         imgURL: catalogProduct.imgThumb,
        //         kgQuantity: brazillianController.bQuantity.value,
        //         selectedDetails: {...productDetails},
        //         selectedDetailsAR: {...productDetailsAR}
        //         // selectedDetails: {...brazillianController.selectedDetails},
        //         // selectedDetailsAR: {...brazillianController.selectedDetailsAR},
        //         ),
        //   ),
        // ),
        SizedBox(height: 50.h),
      ],
    );
  }

  Column _buildEthiopianChoices(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => RadioListTile<EthiopianCoffeeType>(
                  dense: true,
                  title: Text(
                    'plain'.tr,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    TurkishController.turkishKgPrice.toString() +
                        ' ' +
                        'sr'.tr +
                        ' / ' +
                        'kg'.tr,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: EthiopianCoffeeType.turkish,
                  groupValue: ethiopianController.ethiopianCoffeeType.value,
                  onChanged: (EthiopianCoffeeType? value) {
                    ethiopianController.ethiopianCoffeeType.value = value!;
                    removeProductDetails(key: 'withCardamom');
                    addProductDetails(
                      key: en['plain']!,
                      value: TurkishController.turkishKgPrice.toString() +
                          ' ' +
                          en['sr']! +
                          ' / ' +
                          en['kg']!,
                      isCustomized: true,
                    );
                    addProductDetails(
                      key: ar['plain']!,
                      value: TurkishController.turkishKgPrice.toString() +
                          ' ' +
                          ar['sr']! +
                          ' / ' +
                          ar['kg']!,
                      isCustomized: true,
                      isEN: false,
                    );
                  },
                ),
              ),
              Obx(
                () => RadioListTile<EthiopianCoffeeType>(
                  dense: true,
                  title: Text(
                    'withCardamom'.tr,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    TurkishController.turkishCardamomKgPrice.toString() +
                        ' ' +
                        'sr'.tr +
                        ' / ' +
                        'kg'.tr,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: EthiopianCoffeeType.turkishCardamom,
                  groupValue: ethiopianController.ethiopianCoffeeType.value,
                  onChanged: (EthiopianCoffeeType? value) {
                    ethiopianController.ethiopianCoffeeType.value = value!;
                    removeProductDetails(key: 'plain');
                    addProductDetails(
                      key: en['withCardamom']!,
                      value:
                          TurkishController.turkishCardamomKgPrice.toString() +
                              ' ' +
                              en['sr']! +
                              ' / ' +
                              en['kg']!,
                      isCustomized: true,
                    );
                    addProductDetails(
                      key: ar['withCardamom']!,
                      value:
                          TurkishController.turkishCardamomKgPrice.toString() +
                              ' ' +
                              ar['sr']! +
                              ' / ' +
                              ar['kg']!,
                      isCustomized: true,
                      isEN: false,
                    );

                    print(productDetails);
                  },
                ),
              ),
              aDivider(isVerticalPadding: false),
              SizedBox(height: 8.h),
              Text(
                'customizeBlend'.tr,
                style: TextStyle(
                  fontSize: 17.sp,
                ),
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
                      value: ethiopianController.eDarkRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        ethiopianController.eDarkRoastPrecentage.value = val!;
                        addProductDetails(
                          key: en['darkRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['darkRoast']!,
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
                      value: ethiopianController.eMediumRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        ethiopianController.eMediumRoastPrecentage.value = val!;
                        addProductDetails(
                          key: en['mediumRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['mediumRoast']!,
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
                      value: ethiopianController.eLightRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        ethiopianController.eLightRoastPrecentage.value = val!;
                        addProductDetails(
                          key: en['lightRoast']!,
                          value: val,
                          isCustomized: true,
                        );
                        addProductDetails(
                          key: ar['lightRoast']!,
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
              QuantityRow(
                quantity: ethiopianController.eQuantity,
              ),
              SizedBox(height: 10.h),
              aDivider(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        AddNotesTextField(commentController: _commentController),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      price: turkishController.calculateOrderPrice(
                        coffeeType: turkishController.turkishCoffeeType.value,
                        ethiopianCoffeeType:
                            ethiopianController.ethiopianCoffeeType.value,
                      ),
                      imgURL: catalogProduct.imgThumb,
                      kgQuantity: ethiopianController.eQuantity.value,
                      selectedDetails: {...productDetails},
                      selectedDetailsAR: {...productDetailsAR});
                  showToast('addedToCart'.tr);
                  cartProduct.comments = _commentController.text.trim();
                  cartController.addProductToCart(cartProduct);
                  ethiopianController.resetProperties();
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
        //       price: catalogProduct.price,
        //       imgURL: catalogProduct.imgThumb,
        //       kgQuantity: ethiopianController.eQuantity.value,
        //       selectedDetails: {...productDetails},
        //       selectedDetailsAR: {...productDetailsAR},
        //     ),
        //   ),
        // ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
