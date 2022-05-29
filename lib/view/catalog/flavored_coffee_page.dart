import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

enum FlavoredStyle {
  hazenut,
  frenchVanilla,
  chocolate,
  macadomia,
  almonds,
  caramel,
}
enum GroundType { beans, ground }
enum FlavoredType { fine, course, powder }

class FlavoredCoffeePage extends StatefulWidget {
  const FlavoredCoffeePage({Key? key}) : super(key: key);

  @override
  State<FlavoredCoffeePage> createState() => _FlavoredCoffeePageState();
}

class _FlavoredCoffeePageState extends State<FlavoredCoffeePage> {
  FlavoredStyle? _flavoredStyle = FlavoredStyle.hazenut;
  FlavoredType? _flavoredType = FlavoredType.fine;
  GroundType? _groundType = GroundType.beans;
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
                      'Flavored Coffee',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      flavoredStyle: FlavoredStyle.hazenut,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'French Vanilla',
                      flavoredStyle: FlavoredStyle.frenchVanilla,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Chocolate',
                      flavoredStyle: FlavoredStyle.chocolate,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Macadomia',
                      flavoredStyle: FlavoredStyle.macadomia,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Almonds',
                      flavoredStyle: FlavoredStyle.almonds,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Caramel',
                      flavoredStyle: FlavoredStyle.caramel,
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    aDivider(),
                    Text('Type', style: kTxtStyleNormal),
                    RadioListTile<GroundType>(
                      dense: true,
                      title: Text(
                        'Beans',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: GroundType.beans,
                      groupValue: _groundType,
                      onChanged: (value) {
                        setState(() {
                          _groundType = value;
                        });
                      },
                    ),
                    RadioListTile<GroundType>(
                      dense: true,
                      title: Text(
                        'Ground',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: GroundType.ground,
                      groupValue: _groundType,
                      onChanged: (value) {
                        setState(() {
                          _groundType = value;
                        });
                      },
                    ),
                    if (_groundType == GroundType.ground)
                      Column(
                        children: [
                          RadioListTile<FlavoredType>(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 35.w),
                            dense: true,
                            title: Text(
                              'Fine',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            subtitle: const Text('Turkish coffee'),
                            value: FlavoredType.fine,
                            groupValue: _flavoredType,
                            onChanged: (value) {
                              setState(() {
                                _flavoredType = value;
                              });
                            },
                          ),
                          RadioListTile<FlavoredType>(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 35.w),
                            dense: true,
                            title: Text(
                              'Light Powder',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            subtitle: const Text('Espresso Machine'),
                            value: FlavoredType.powder,
                            groupValue: _flavoredType,
                            onChanged: (value) {
                              setState(() {
                                _flavoredType = value;
                              });
                            },
                          ),
                          RadioListTile<FlavoredType>(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 35.w),
                            dense: true,
                            title: Text(
                              'Course',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            subtitle: const Text('Brewed Coffee'),
                            value: FlavoredType.course,
                            groupValue: _flavoredType,
                            onChanged: (value) {
                              setState(() {
                                _flavoredType = value;
                              });
                            },
                          ),
                        ],
                      ),
                    QuantityRow(
                      quantity: _quantity,
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

  RadioListTile<FlavoredStyle> _buildRadioTileFlavored({
    required String title,
    required FlavoredStyle flavoredStyle,
    required Function(FlavoredStyle?) onPress,
  }) {
    return RadioListTile<FlavoredStyle>(
      dense: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
      value: flavoredStyle,
      groupValue: _flavoredStyle,
      onChanged: onPress,
    );
  }
}
