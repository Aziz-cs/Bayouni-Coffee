import 'package:bayouni_coffee/controller/catalog_controllers/turkish_controller.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/my_drop_menu.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                    'Turkish',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    'SAR 67.00 / KG',
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
                    'Turkish with cardamom',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    'SAR 71.00 / KG',
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
                'Customize your blend',
                style: TextStyle(
                  fontSize: 17.sp,
                ),
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
                    'Medium Roast',
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
                    'Light Roast',
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
        TotalVAT(
          productTitle: catalogProduct.name,
          productPrice: catalogProduct.price,
          productIMG: catalogProduct.imgThumb,
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
