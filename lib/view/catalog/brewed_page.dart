import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../widgets/my_drop_menu.dart';

enum BrewedType { special, customized }
enum CoffeeType { beans, ground }

class BrewedPage extends StatefulWidget {
  const BrewedPage({Key? key}) : super(key: key);

  @override
  State<BrewedPage> createState() => _BrewedPageState();
}

class _BrewedPageState extends State<BrewedPage> {
  BrewedType? _brewedType = BrewedType.special;
  CoffeeType? _coffeeType = CoffeeType.beans;
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
                    RadioListTile<BrewedType>(
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
                      groupValue: _brewedType,
                      onChanged: (value) {
                        setState(() {
                          _brewedType = value;
                        });
                      },
                    ),
                    RadioListTile<BrewedType>(
                      dense: true,
                      title: Text(
                        'Customize your own blend',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: BrewedType.customized,
                      groupValue: _brewedType,
                      onChanged: (value) {
                        setState(() {
                          _brewedType = value;
                        });
                      },
                    ),
                    _brewedType == BrewedType.special
                        ? _buildSpecialBrewedOrder()
                        : _buildCustomizedBrewedOrder(),
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
              'Medium Roast',
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
              'Light Roast',
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
              'Medium Roast',
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
              'Light Roast',
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
        Text('Type', style: kTxtStyleNormal),
        RadioListTile<CoffeeType>(
          dense: true,
          title: Text(
            'Beans',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: CoffeeType.beans,
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
            'Ground',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: CoffeeType.ground,
          groupValue: _coffeeType,
          onChanged: (value) {
            setState(() {
              _coffeeType = value;
            });
          },
        ),
        aDivider(),
        QuantityRow(quantity: _quantity),
      ],
    );
  }

  Column _buildSpecialBrewedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type', style: kTxtStyleNormal),
        RadioListTile<CoffeeType>(
          dense: true,
          title: Text(
            'Beans',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: CoffeeType.beans,
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
            'Ground',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          value: CoffeeType.ground,
          groupValue: _coffeeType,
          onChanged: (value) {
            setState(() {
              _coffeeType = value;
            });
          },
        ),
        aDivider(),
        QuantityRow(quantity: _quantity),
      ],
    );
  }
}
