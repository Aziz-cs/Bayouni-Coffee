import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FlavoredStyle {
  hazenut,
  frenchVanilla,
  chocolate,
  macadomia,
  almonds,
  caramel,
}
enum FlavoredType { fine, coarse }
enum GroundType { gram3, gram5 }

class FlavoredCoffeePage extends StatefulWidget {
  const FlavoredCoffeePage({Key? key}) : super(key: key);

  @override
  State<FlavoredCoffeePage> createState() => _FlavoredCoffeePageState();
}

class _FlavoredCoffeePageState extends State<FlavoredCoffeePage> {
  FlavoredStyle? _flavoredStyle = FlavoredStyle.hazenut;
  FlavoredType _flavoredType = FlavoredType.fine;
  GroundType _groundType = GroundType.gram3;
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
                      'Flavored Coffee',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'French Vanilla',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
                    _buildRadioTileFlavored(
                      title: 'Hazenut',
                      onPress: (value) {
                        setState(() {
                          _flavoredStyle = value;
                        });
                      },
                    ),
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

  RadioListTile<FlavoredStyle> _buildRadioTileFlavored({
    required String title,
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
      value: FlavoredStyle.hazenut,
      groupValue: _flavoredStyle,
      onChanged: onPress,
    );
  }
}
