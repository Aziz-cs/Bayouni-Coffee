import 'package:bayouni_coffee/controller/catalog_controllers/additives_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/catalog_product.dart';

class AdditivesPage extends StatelessWidget {
  AdditivesPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;

  final additivesController = Get.put(AdditivesController());

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
                    const Text('Back to Catalog'),
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
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.heart_circle_fill,
                        color: Colors.white,
                        size: 29,
                      ),
                      onPressed: () {
                        showToast('Under construction');
                        // showToast('Added to favorites');
                      },
                    ),
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
                            'American cardamim jambo',
                            style: kTxtStyleNormal,
                          ),
                        ),
                      ],
                    ),
                    aDivider(),
                    Text('Type', style: kTxtStyleNormal),
                    Obx(
                      () => RadioListTile<AdditivesType>(
                        dense: true,
                        title: Text(
                          'Beans',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: AdditivesType.beans,
                        groupValue: additivesController.additivesType.value,
                        onChanged: (value) {
                          additivesController.additivesType.value =
                              value ?? AdditivesType.beans;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<AdditivesType>(
                        dense: true,
                        title: Text(
                          'Course (Granular)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: AdditivesType.ground,
                        groupValue: additivesController.additivesType.value,
                        onChanged: (value) {
                          additivesController.additivesType.value =
                              value ?? AdditivesType.beans;
                        },
                      ),
                    ),
                    if (additivesController.additivesType.value ==
                        AdditivesType.ground)
                      Column(
                        children: [
                          Obx(
                            () => RadioListTile<CoffeeType>(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 35.w),
                              dense: true,
                              title: Text(
                                'Fine (Powder)',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                              value: CoffeeType.fine,
                              groupValue: additivesController.coffeeType.value,
                              onChanged: (value) {},
                            ),
                          ),
                          Obx(
                            () => RadioListTile<CoffeeType>(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 35.w),
                              dense: true,
                              title: Text(
                                'Ground',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                              value: CoffeeType.coarse,
                              groupValue: additivesController.coffeeType.value,
                              onChanged: (value) {
                                additivesController.coffeeType.value =
                                    value ?? CoffeeType.fine;
                              },
                            ),
                          ),
                        ],
                      ),
                    aDivider(),
                    QuantityRow(
                      quantity: additivesController.quantity,
                    ),
                    aDivider(),
                    Text(
                      'Saffron',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Obx(
                      () => RadioListTile<SaffronGram>(
                        dense: true,
                        title: Text(
                          '3 grams',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: SaffronGram.gram3,
                        groupValue: additivesController.saffronGram.value,
                        onChanged: (value) {
                          additivesController.saffronGram.value =
                              value ?? SaffronGram.gram3;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<SaffronGram>(
                        dense: true,
                        title: Text(
                          '5 grams',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: SaffronGram.gram5,
                        groupValue: additivesController.saffronGram.value,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 13.h),
                    aDivider(),
                    SizedBox(height: 13.h),
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
    );
  }
}
