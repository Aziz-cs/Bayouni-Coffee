import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/catalog_controllers/arabic_coffee_controller.dart';
import '../widgets/my_drop_menu.dart';

class ArabicCoffeePage extends StatelessWidget {
  ArabicCoffeePage({Key? key}) : super(key: key);
  final arabicCoffeeController = Get.put(ArabicCoffeController());

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
                  Image.asset('assets/images/catalog_arabic_coffee_big.png'),
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
                      'Saudi Coffee',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'Special Blend',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'SR. 72.00',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        value: CoffeeType.specialBlend,
                        groupValue: arabicCoffeeController.coffeeType.value,
                        onChanged: (value) {
                          arabicCoffeeController.coffeeType.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile<CoffeeType>(
                        dense: true,
                        title: Text(
                          'Customize',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Make your own blend\nSR. 72.00',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        isThreeLine: true,
                        value: CoffeeType.customize,
                        groupValue: arabicCoffeeController.coffeeType.value,
                        onChanged: (value) {
                          arabicCoffeeController.coffeeType.value = value!;
                        },
                      ),
                    ),
                    arabicCoffeeController.coffeeType.value ==
                            CoffeeType.specialBlend
                        ? _buildSpecialArabicOrder()
                        : _buildCustomizedArabicOrder(),
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

  Column _buildCustomizedArabicOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'Customize (Plain coffee)',
          style: kTxtStyleNormal,
        ),
        Text(
          'Make your own blend',
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark Roast',
              style: kTxtStyleNormal,
            ),
            Obx(
              () => MyDropDownMenu(
                value: arabicCoffeeController.darkRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.darkRoastPrecentage.value = val!;
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
                value: arabicCoffeeController.mediumRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.mediumRoastPrecentage.value = val!;
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
                value: arabicCoffeeController.lightRoastPrecentage.value,
                items: precentageList,
                onChanged: (val) {
                  arabicCoffeeController.lightRoastPrecentage.value = val!;
                },
              ),
            ),
          ],
        ),
        aDivider(),
        QuantityRow(quantity: arabicCoffeeController.quantity.value),
        aDivider(),
        Text('Type', style: kTxtStyleNormal),
        Obx(
          () => RadioListTile<BlendType>(
            dense: true,
            title: Text(
              'Beans',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: BlendType.beans,
            groupValue: arabicCoffeeController.blendType.value,
            onChanged: (value) {
              arabicCoffeeController.blendType.value = value!;
            },
          ),
        ),
        Obx(
          () => RadioListTile<BlendType>(
            dense: true,
            title: Text(
              'Ground',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            value: BlendType.ground,
            groupValue: arabicCoffeeController.blendType.value,
            onChanged: (value) {
              arabicCoffeeController.blendType.value = value!;
            },
          ),
        ),
        if (arabicCoffeeController.blendType.value == BlendType.ground)
          Column(
            children: [
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'Fine',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.fine,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'Medium',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.medium,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
              Obx(
                () => RadioListTile<BlendTense>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                  dense: true,
                  title: Text(
                    'Course',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  value: BlendTense.course,
                  groupValue: arabicCoffeeController.blendTense.value,
                  onChanged: (value) {
                    arabicCoffeeController.blendTense.value = value!;
                  },
                ),
              ),
            ],
          ),
        aDivider(),
        Text(
          'Additional option',
          style: kTxtStyleNormal,
        ),
        Obx(
          () => CheckboxListTile(
            title: Text(
              'Saffron',
              style: kTxtStyleNormal,
            ),
            subtitle: Text(
              '3gms, SR. 34.00',
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            value: arabicCoffeeController.isSaffron.value,
            onChanged: (value) {
              arabicCoffeeController.isSaffron.value =
                  !arabicCoffeeController.isSaffron.value;
            },
          ),
        ),
      ],
    );
  }

  Column _buildSpecialArabicOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'Special Blend',
          style: kTxtStyleNormal,
        ),
        Text(
          'Pre-Blended Coffee and Cardamon',
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        Obx(
          () => CheckboxListTile(
            title: Text(
              'Saffron',
              style: kTxtStyleNormal,
            ),
            subtitle: Text(
              '3gms, SR. 34.00',
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            value: arabicCoffeeController.isSaffron.value,
            onChanged: (value) {
              arabicCoffeeController.isSaffron.value =
                  !arabicCoffeeController.isSaffron.value;
            },
          ),
        ),
        aDivider(),
        QuantityRow(quantity: arabicCoffeeController.quantity.value),
      ],
    );
  }
}
