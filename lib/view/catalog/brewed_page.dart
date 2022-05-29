import 'package:bayouni_coffee/controller/catalog_controllers/brewed_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/my_drop_menu.dart';

class BrewedPage extends StatelessWidget {
  BrewedPage({Key? key}) : super(key: key);

  final brewedController = Get.put(BrewedController());

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
                  Image.asset('assets/images/catalog_brewed_big.png'),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.heart_circle_fill,
                        color: Colors.white,
                        size: 29,
                      ),
                      onPressed: () {
                        showToast('Added to favorites');
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
                      'Brewed Coffee',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    aDivider(),
                    Obx(
                      () => RadioListTile<BrewedType>(
                        dense: true,
                        title: Text(
                          'Special blend medium roast (recommended)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Ethiopian + Colombian',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        value: BrewedType.special,
                        groupValue: brewedController.brewedType.value,
                        onChanged: (value) {
                          brewedController.brewedType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<BrewedType>(
                        dense: true,
                        title: Text(
                          'Customize your own blend',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        value: BrewedType.customized,
                        groupValue: brewedController.brewedType.value,
                        onChanged: (value) {
                          brewedController.brewedType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => brewedController.brewedType.value ==
                              BrewedType.special
                          ? _buildSpecialBrewedOrder()
                          : _buildCustomizedBrewedOrder(),
                    ),
                  ],
                ),
              ),
              TotalVAT(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCustomizedBrewedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                value: brewedController.eDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eDarkRoastPrecentage.value = val!;
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
                value: brewedController.eMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eMediumRoastPrecentage.value = val!;
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
                value: brewedController.eLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eLightRoastPrecentage.value = val!;
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
                value: brewedController.eDarkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eDarkRoastPrecentage.value = val!;
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
                value: brewedController.eMediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eMediumRoastPrecentage.value = val!;
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
                value: brewedController.eLightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  brewedController.eLightRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        aDivider(),
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
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
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
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: brewedController.quantity.value),
      ],
    );
  }

  Column _buildSpecialBrewedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
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
            groupValue: brewedController.coffeeType.value,
            onChanged: (value) {
              brewedController.coffeeType.value = value!;
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: brewedController.quantity.value),
      ],
    );
  }
}