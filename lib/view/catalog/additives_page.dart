import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/brazillian_coffee_widget%20copy.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/ethiopian_coffee_widget.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AdditivesType { beans, ground }
enum CoffeeType { fine, coarse }
enum SaffronGram { gram3, gram5 }

class AdditivesPage extends StatefulWidget {
  const AdditivesPage({Key? key}) : super(key: key);

  @override
  State<AdditivesPage> createState() => _AdditivesPageState();
}

class _AdditivesPageState extends State<AdditivesPage> {
  AdditivesType _coffeeType = AdditivesType.beans;
  CoffeeType _groundType = CoffeeType.fine;
  SaffronGram _saffronGram = SaffronGram.gram3;
  double _quantity = 1;

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
                  Image.asset('assets/images/catalog_additives_big.png'),
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
                      'Additives',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.radio_button_on_outlined,
                          color: Colors.brown,
                          size: 21,
                        ),
                        SizedBox(width: 5.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Text(
                            'American cardamim jambo',
                            style: kTxtStyleNormal,
                          ),
                        ),
                      ],
                    ),
                    aDivider(),
                    Text('Type', style: kTxtStyleNormal),
                    RadioListTile<AdditivesType>(
                      dense: true,
                      title: Text(
                        'Beans',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: AdditivesType.beans,
                      groupValue: _coffeeType,
                      onChanged: (value) {
                        setState(() {
                          _coffeeType = value ?? AdditivesType.beans;
                        });
                      },
                    ),
                    RadioListTile<AdditivesType>(
                      dense: true,
                      title: Text(
                        'Course (Granular)',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: AdditivesType.ground,
                      groupValue: _coffeeType,
                      onChanged: (value) {
                        setState(() {
                          _coffeeType = value ?? AdditivesType.beans;
                        });
                      },
                    ),
                    if (_coffeeType == AdditivesType.ground)
                      Column(
                        children: [
                          RadioListTile<CoffeeType>(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 35.w),
                            dense: true,
                            title: Text(
                              'Fine (Powder)',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            value: CoffeeType.fine,
                            groupValue: _groundType,
                            onChanged: (value) {
                              setState(() {
                                _groundType = value ?? CoffeeType.fine;
                              });
                            },
                          ),
                          RadioListTile<CoffeeType>(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 35.w),
                            dense: true,
                            title: Text(
                              'Ground',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            value: CoffeeType.coarse,
                            groupValue: _groundType,
                            onChanged: (value) {
                              setState(() {
                                _groundType = value ?? CoffeeType.fine;
                              });
                            },
                          ),
                        ],
                      ),
                    aDivider(),
                    QuantityRow(
                      quantity: _quantity,
                    ),
                    aDivider(),
                    Text(
                      'Saffron',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    RadioListTile<SaffronGram>(
                      dense: true,
                      title: Text(
                        '3 grams',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: SaffronGram.gram3,
                      groupValue: _saffronGram,
                      onChanged: (value) {
                        setState(() {
                          _saffronGram = value ?? SaffronGram.gram3;
                        });
                      },
                    ),
                    RadioListTile<SaffronGram>(
                      dense: true,
                      title: Text(
                        '5 grams',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: SaffronGram.gram5,
                      groupValue: _saffronGram,
                      onChanged: (value) {
                        setState(() {
                          _saffronGram = value ?? SaffronGram.gram5;
                        });
                      },
                    ),
                    SizedBox(height: 13.h),
                    aDivider(),
                    SizedBox(height: 13.h),
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
}
