import 'package:bayouni_coffee/controller/catalog_controllers/blacktea_controller.dart';
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

class BlackTeaPage extends StatelessWidget {
  BlackTeaPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  final CatalogProduct catalogProduct;
  final blackTeaController = Get.put(BlackTeaController());
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
                        },
                        title: Text(
                          'Bayouni Black Tea',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Good quality black Kenyan tea',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => RadioListTile<BlackTeaType>(
                        dense: true,
                        title: Text(
                          'Box (2 x 750gms)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'SR. 42.00',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        value: BlackTeaType.box,
                        groupValue: blackTeaController.blackTeaType.value,
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
                          'Bag (1 x 750gms)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'SR. 21.00',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        value: BlackTeaType.bag,
                        groupValue: blackTeaController.blackTeaType.value,
                        onChanged: (value) {
                          blackTeaController.blackTeaType.value =
                              value ?? BlackTeaType.box;
                        },
                      ),
                    ),
                    QuantityRow(
                      quantity: blackTeaController.quanitity,
                      isFractioned: false,
                      mesurementUnit: blackTeaController.blackTeaType.value ==
                              BlackTeaType.box
                          ? 'Box'
                          : 'Bag',
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
                        },
                        title: Text(
                          'Green Tea',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'SR. 54.00 / kg',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    QuantityRow(
                      quantity: blackTeaController.quanitity,
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
                        },
                        title: Text(
                          'Shakir Tea 500gms',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'SR. 65.00 / can',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    QuantityRow(
                      quantity: blackTeaController.quanitity,
                      isFractioned: false,
                      mesurementUnit: 'PC',
                    ),
                    aDivider(),
                  ],
                ),
              ),
              ShoppingButtons(
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
}
