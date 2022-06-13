import 'package:bayouni_coffee/controller/catalog_controllers/espresso_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';
import '../widgets/my_drop_menu.dart';

class EspressoPage extends StatelessWidget {
  EspressoPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);

  CatalogProduct catalogProduct;
  final espressoController = Get.put(EspressoController());

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
                      'Espresso',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    aDivider(),
                    Obx(
                      () => RadioListTile<EspressoType>(
                        dense: true,
                        title: Text(
                          'Special italian roasting blend',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Recommended',
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
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<EspressoType>(
                        dense: true,
                        title: Text(
                          'Customize your own blend',
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
                        },
                      ),
                    ),
                    Text('Type', style: kTxtStyleNormal),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'Beans',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: CoffeeType.beans,
                        groupValue: espressoController.coffeeType.value,
                        onChanged: (value) {
                          espressoController.coffeeType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'Ground',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: CoffeeType.ground,
                        groupValue: espressoController.coffeeType.value,
                        onChanged: (value) {
                          espressoController.coffeeType.value = value!;
                          espressoController.groundType.value = GroundType.fine;
                        },
                      ),
                    ),
                    Obx(
                      () => espressoController.coffeeType.value ==
                              CoffeeType.ground
                          ? Column(
                              children: [
                                RadioListTile<GroundType>(
                                  dense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 35.w),
                                  title: Text(
                                    'Fine Grind',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Electrical coffee maker',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  value: GroundType.fine,
                                  groupValue:
                                      espressoController.groundType.value,
                                  onChanged: (value) {
                                    espressoController.groundType.value =
                                        value!;
                                  },
                                ),
                                Obx(
                                  () => RadioListTile<GroundType>(
                                    dense: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 35.w),
                                    title: Text(
                                      'Course Grind',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Stovetop coffee maker',
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
                                    },
                                  ),
                                ),
                              ],
                            )
                          : _buildCustomizedEspressoOrder(),
                    ),
                    aDivider(),
                    QuantityRow(
                      quantity: espressoController.quantity,
                    ),
                    // ? _buildSpecialEspressoOrder()
                  ],
                ),
              ),
              TotalVAT(
                productTitle: catalogProduct.name,
                productPrice: catalogProduct.price,
                productIMG: catalogProduct.imgThumb,
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
            Obx(
              () => Checkbox(
                  value: espressoController.isItalianRoast.value,
                  onChanged: (_) {
                    espressoController.isItalianRoast.value =
                        !espressoController.isItalianRoast.value;
                  }),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Italian',
                  style: kTxtStyleNormal,
                ),
                Text(
                  'Special Italian roast',
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
              child: Text('Ethiopian blend precentage',
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
              'Dark Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.eDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eDarkRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Medium Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.eMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eMediumRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Light Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.eLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.eLightRoastPrecentage.value = val!;
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
              child: Text('Colombian blend precentage',
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
              'Dark Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.cDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cDarkRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Medium Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.cMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cMediumRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Light Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: espressoController.cLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  espressoController.cLightRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        // aDivider(),
        // Text('Type', style: kTxtStyleNormal),
        // RadioListTile<CoffeeType>(
        //   dense: true,
        //   title: Text(
        //     'Beans',
        //     style: TextStyle(
        //       fontSize: 15.sp,
        //     ),
        //   ),
        //   value: CoffeeType.beans,
        //   groupValue: _coffeeType,
        //   onChanged: (value) {
        //     setState(() {
        //       _coffeeType = value;
        //     });
        //   },
        // ),
        // RadioListTile<CoffeeType>(
        //   dense: true,
        //   title: Text(
        //     'Ground',
        //     style: TextStyle(
        //       fontSize: 15.sp,
        //     ),
        //   ),
        //   value: CoffeeType.ground,
        //   groupValue: _coffeeType,
        //   onChanged: (value) {
        //     setState(() {
        //       _coffeeType = value;
        //     });
        //   },
        // ),
        // if (_coffeeType == CoffeeType.ground)
        //   Column(
        //     children: [
        //       RadioListTile<GroundType>(
        //         dense: true,
        //         contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
        //         title: Text(
        //           'Fine Grind',
        //           style: TextStyle(
        //             fontSize: 14.sp,
        //           ),
        //         ),
        //         subtitle: Text(
        //           'Electrical coffee maker',
        //           style: TextStyle(
        //             fontSize: 13.sp,
        //           ),
        //         ),
        //         value: GroundType.fine,
        //         groupValue: _groundType,
        //         onChanged: (value) {
        //           setState(() {
        //             _groundType = value;
        //           });
        //         },
        //       ),
        //       RadioListTile<GroundType>(
        //         dense: true,
        //         contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
        //         title: Text(
        //           'Course Grind',
        //           style: TextStyle(
        //             fontSize: 15.sp,
        //           ),
        //         ),
        //         subtitle: Text(
        //           'Stovetop coffee maker',
        //           style: TextStyle(
        //             fontSize: 13.sp,
        //           ),
        //         ),
        //         value: GroundType.course,
        //         groupValue: _groundType,
        //         onChanged: (value) {
        //           setState(() {
        //             _groundType = value;
        //           });
        //         },
        //       ),
        //     ],
        //   ),
        // aDivider(),
        // QuantityRow(
        //   quantity: espressoController.quantity.value,
        // ),
      ],
    );
  }

  Column _buildSpecialEspressoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
