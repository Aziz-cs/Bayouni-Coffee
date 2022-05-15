import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../widgets/my_drop_menu.dart';

enum EspressoType { special, customized }
enum CoffeeType { beans, ground }
enum GroundType { fine, course }

class EspressoPage extends StatefulWidget {
  const EspressoPage({Key? key}) : super(key: key);

  @override
  State<EspressoPage> createState() => _EspressoPageState();
}

class _EspressoPageState extends State<EspressoPage> {
  EspressoType? _espressoType = EspressoType.special;
  CoffeeType? _coffeeType = CoffeeType.beans;
  GroundType? _groundType = GroundType.fine;
  bool isItalianRoast = false;
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
                  Image.asset('assets/images/catalog_flavored_big.png'),
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
                      'Espresso',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    aDivider(),
                    RadioListTile<EspressoType>(
                      dense: true,
                      title: Text(
                        'Special italian roasting blend',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      subtitle: Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      value: EspressoType.special,
                      groupValue: _espressoType,
                      onChanged: (value) {
                        setState(() {
                          _espressoType = value;
                        });
                      },
                    ),
                    RadioListTile<EspressoType>(
                      dense: true,
                      title: Text(
                        'Customize your own blend',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: EspressoType.customized,
                      groupValue: _espressoType,
                      onChanged: (value) {
                        setState(() {
                          _espressoType = value;
                        });
                      },
                    ),
                    _espressoType == EspressoType.special
                        ? _buildSpecialEspressoOrder()
                        : _buildCustomizedEspressoOrder(),
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

  Column _buildCustomizedEspressoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
                value: isItalianRoast,
                onChanged: (_) {
                  setState(() {
                    isItalianRoast = !isItalianRoast;
                  });
                }),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Italian',
                  style: kTxtStyleNormal,
                ),
                Text(
                  'Special Italian roast',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            isItalianRoast
                ? MyDropDownMenu(
                    value: '10 %',
                    items: precentageList,
                    onChanged: (val) {},
                  )
                : const SizedBox(),
          ],
        ),
        SizedBox(height: 10.h),
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
        if (_coffeeType == CoffeeType.ground)
          Column(
            children: [
              RadioListTile<GroundType>(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                title: Text(
                  'Fine Grind',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                subtitle: Text(
                  'Electrical coffee maker',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: GroundType.fine,
                groupValue: _groundType,
                onChanged: (value) {
                  setState(() {
                    _groundType = value;
                  });
                },
              ),
              RadioListTile<GroundType>(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                title: Text(
                  'Course Grind',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                subtitle: Text(
                  'Stovetop coffee maker',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: GroundType.course,
                groupValue: _groundType,
                onChanged: (value) {
                  setState(() {
                    _groundType = value;
                  });
                },
              ),
            ],
          ),
        aDivider(),
        QuantityRow(quantity: _quantity),
      ],
    );
  }

  Column _buildSpecialEspressoOrder() {
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
        if (_coffeeType == CoffeeType.ground)
          Column(
            children: [
              RadioListTile<GroundType>(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                title: Text(
                  'Fine Grind',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                subtitle: Text(
                  'Electrical coffee maker',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: GroundType.fine,
                groupValue: _groundType,
                onChanged: (value) {
                  setState(() {
                    _groundType = value;
                  });
                },
              ),
              RadioListTile<GroundType>(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
                title: Text(
                  'Course Grind',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                subtitle: Text(
                  'Stovetop coffee maker',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                value: GroundType.course,
                groupValue: _groundType,
                onChanged: (value) {
                  setState(() {
                    _groundType = value;
                  });
                },
              ),
            ],
          ),
        aDivider(),
        QuantityRow(quantity: _quantity),
      ],
    );
  }
}
