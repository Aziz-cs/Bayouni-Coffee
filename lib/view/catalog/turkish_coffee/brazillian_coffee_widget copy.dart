import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../widgets/my_drop_menu.dart';
import '../../widgets/quantity_row.dart';
import '../../widgets/widgets_helper.dart';

enum BrazillianCoffeeType { brazillian, brazillianCardamom }

class BrazillianCoffeeWidget extends StatefulWidget {
  const BrazillianCoffeeWidget({Key? key}) : super(key: key);

  @override
  State<BrazillianCoffeeWidget> createState() => _BrazillianCoffeeWidgetState();
}

class _BrazillianCoffeeWidgetState extends State<BrazillianCoffeeWidget> {
  BrazillianCoffeeType? _brazillianCoffeeType = BrazillianCoffeeType.brazillian;
  final int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<BrazillianCoffeeType>(
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
                groupValue: _brazillianCoffeeType,
                onChanged: (BrazillianCoffeeType? value) {
                  setState(() {
                    _brazillianCoffeeType = value;
                  });
                },
              ),
              RadioListTile<BrazillianCoffeeType>(
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
                groupValue: _brazillianCoffeeType,
                onChanged: (BrazillianCoffeeType? value) {
                  setState(() {
                    _brazillianCoffeeType = value;
                  });
                },
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
              SizedBox(height: 10.h),
              aDivider(),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VAT included',
                    style: kTxtStyleNormal,
                  ),
                  Text(
                    "\$75",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: kBeige,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        const TotalVAT(),
        SizedBox(height: 50.h),
      ],
    );
  }
}
