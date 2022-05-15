import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/widgets/my_drop_menu.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/widgets_helper.dart';

enum EthiopianCoffeeType { turkish, turkishCardamom }

class EthiopianCoffeeWidget extends StatefulWidget {
  const EthiopianCoffeeWidget({Key? key}) : super(key: key);

  @override
  State<EthiopianCoffeeWidget> createState() => _EthiopianCoffeeWidgetState();
}

class _EthiopianCoffeeWidgetState extends State<EthiopianCoffeeWidget> {
  EthiopianCoffeeType? _ethiopianCoffeeType = EthiopianCoffeeType.turkish;
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
              RadioListTile<EthiopianCoffeeType>(
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
                groupValue: _ethiopianCoffeeType,
                onChanged: (EthiopianCoffeeType? value) {
                  setState(() {
                    _ethiopianCoffeeType = value;
                  });
                },
              ),
              RadioListTile<EthiopianCoffeeType>(
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
                groupValue: _ethiopianCoffeeType,
                onChanged: (EthiopianCoffeeType? value) {
                  setState(() {
                    _ethiopianCoffeeType = value;
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
