import 'package:bayouni_coffee/controller/catalog_controllers/turkish_controller.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/my_drop_menu.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/cart_product.dart';
import '../../../model/catalog_product.dart';
import '../../widgets/widgets_helper.dart';

class EthiopianCoffeeWidget extends StatelessWidget {
  EthiopianCoffeeWidget({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  final ethiopianController = Get.find<TurkishController>();
  final CatalogProduct catalogProduct;
  @override
  Widget build(BuildContext context) {
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'VAT included',
              //       style: kTxtStyleNormal,
              //     ),
              //     Text(
              //       "\$100",
              //       style: TextStyle(
              //         fontSize: 16.sp,
              //         color: kBeige,
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
        Obx(
          () => ShoppingButtons(
            cartProduct: CartProduct(
              name: catalogProduct.name,
              nameAR: catalogProduct.nameAR,
              price: catalogProduct.price,
              imgURL: catalogProduct.imgThumb,
              kgQuantity: ethiopianController.eQuantity.value,
              selectedDetails: {...ethiopianController.selectedDetails},
              selectedDetailsAR: {...ethiopianController.selectedDetailsAR},
            ),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
