import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/catalog_controllers/turkish_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/my_drop_menu.dart';
import '../../widgets/quantity_row.dart';
import '../../widgets/widgets_helper.dart';

class BrazillianCoffeeWidget extends StatelessWidget {
  BrazillianCoffeeWidget({Key? key}) : super(key: key);
  final turkishController = Get.find<TurkishController>();
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
                () => RadioListTile<BrazillianCoffeeType>(
                  dense: true,
                  title: Text(
                    'Brazillian',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    'SAR 57.00 / KG',
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: BrazillianCoffeeType.brazillian,
                  groupValue: turkishController.brazillianCoffeeType.value,
                  onChanged: (BrazillianCoffeeType? value) {
                    turkishController.brazillianCoffeeType.value = value!;
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BrazillianCoffeeType>(
                  dense: true,
                  title: Text(
                    'Brazillian with cardamom',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  subtitle: Text(
                    'SAR 61.00 / KG',
                    style: TextStyle(
                      fontSize: 13.5.sp,
                    ),
                  ),
                  value: BrazillianCoffeeType.brazillianCardamom,
                  groupValue: turkishController.brazillianCoffeeType.value,
                  onChanged: (BrazillianCoffeeType? value) {
                    turkishController.brazillianCoffeeType.value = value!;
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
                      value: turkishController.bDarkRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        turkishController.bDarkRoastPrecentage.value = val!;
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
                      value: turkishController.bMediumRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        turkishController.bMediumRoastPrecentage.value = val!;
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
                      value: turkishController.bLightRoastPrecentage.value,
                      items: precentageList,
                      onChanged: (val) {
                        turkishController.bLightRoastPrecentage.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              aDivider(),
              QuantityRow(
                quantity: turkishController.bQuantity,
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
        TotalVAT(),
        SizedBox(height: 50.h),
      ],
    );
  }
}
