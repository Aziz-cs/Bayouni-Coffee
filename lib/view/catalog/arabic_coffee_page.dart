import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/my_drop_menu.dart';

enum CoffeeType { specialBlend, customize }
enum BlendType { beans, ground }
enum BlendTense { fine, medium, course }

class ArabicCoffeePage extends StatefulWidget {
  const ArabicCoffeePage({Key? key}) : super(key: key);

  @override
  State<ArabicCoffeePage> createState() => _ArabicCoffeePageState();
}

class _ArabicCoffeePageState extends State<ArabicCoffeePage> {
  CoffeeType? _coffeeType = CoffeeType.specialBlend;
  BlendType? _blendType = BlendType.beans;
  BlendTense? _blendTense = BlendTense.fine;
  bool _isSaffron = false;
  int _quantity = 1;

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
                    RadioListTile<CoffeeType>(
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
                      groupValue: _coffeeType,
                      onChanged: (value) {
                        setState(() {
                          _coffeeType = value;
                        });
                      },
                    ),
                    RadioListTile<CoffeeType>(
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
                      groupValue: _coffeeType,
                      onChanged: (value) {
                        setState(() {
                          _coffeeType = value;
                        });
                      },
                    ),
                    _coffeeType == CoffeeType.specialBlend
                        ? _buildSpecialArabicOrder()
                        : _buildCustomizedArabicOrder(),
                  ],
                ),
              ),
              const TotalVAT(),
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
              'Dark Precentage',
              style: kTxtStyleNormal,
            ),
            MyDropDownMenu(
              value: '10 %',
              items: precentageList,
              onChanged: (val) {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Medium Precentage',
              style: kTxtStyleNormal,
            ),
            MyDropDownMenu(
              value: '10 %',
              items: precentageList,
              onChanged: (val) {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Light Precentage',
              style: kTxtStyleNormal,
            ),
            MyDropDownMenu(
              value: '10 %',
              items: precentageList,
              onChanged: (val) {},
            ),
          ],
        ),
        aDivider(),
        QuantityRow(quantity: _quantity),
        aDivider(),
        Text('Type', style: kTxtStyleNormal),
        RadioListTile<BlendType>(
          dense: true,
          title: Text(
            'Beans',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: BlendType.beans,
          groupValue: _blendType,
          onChanged: (value) {
            setState(() {
              _blendType = value;
            });
          },
        ),
        RadioListTile<BlendType>(
          dense: true,
          title: Text(
            'Ground',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: BlendType.ground,
          groupValue: _blendType,
          onChanged: (value) {
            setState(() {
              _blendType = value;
            });
          },
        ),
        if (_blendType == BlendType.ground)
          Column(
            children: [
              RadioListTile<BlendTense>(
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                dense: true,
                title: Text(
                  'Fine',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: BlendTense.fine,
                groupValue: _blendTense,
                onChanged: (value) {
                  setState(() {
                    _blendTense = value;
                  });
                },
              ),
              RadioListTile<BlendTense>(
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                dense: true,
                title: Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: BlendTense.medium,
                groupValue: _blendTense,
                onChanged: (value) {
                  setState(() {
                    _blendTense = value;
                  });
                },
              ),
              RadioListTile<BlendTense>(
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                dense: true,
                title: Text(
                  'Course',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: BlendTense.course,
                groupValue: _blendTense,
                onChanged: (value) {
                  setState(() {
                    _blendTense = value;
                  });
                },
              ),
            ],
          ),
        aDivider(),
        Text(
          'Additional option',
          style: kTxtStyleNormal,
        ),
        CheckboxListTile(
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
          value: _isSaffron,
          onChanged: (value) {
            setState(() {
              _isSaffron = !_isSaffron;
            });
          },
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
        CheckboxListTile(
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
          value: _isSaffron,
          onChanged: (value) {
            setState(() {
              _isSaffron = !_isSaffron;
            });
          },
        ),
        aDivider(),
        QuantityRow(quantity: _quantity),
      ],
    );
  }
}
