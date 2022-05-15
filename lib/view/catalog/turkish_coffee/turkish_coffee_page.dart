import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/brazillian_coffee_widget%20copy.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/ethiopian_coffee_widget.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TurkishCoffeeType { ethiopian, brazillian }

class TurkishCoffeePage extends StatefulWidget {
  const TurkishCoffeePage({Key? key}) : super(key: key);

  @override
  State<TurkishCoffeePage> createState() => _TurkishCoffeePageState();
}

class _TurkishCoffeePageState extends State<TurkishCoffeePage> {
  TurkishCoffeeType? _coffeeType = TurkishCoffeeType.ethiopian;

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
                      constraints: BoxConstraints(),
                    ),
                    Text('Back to Catalog'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Image.asset('assets/images/catalog_turkish_big.png'),
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
                      'Turkish Coffee',
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                    RadioListTile<TurkishCoffeeType>(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Ethiopian',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: TurkishCoffeeType.ethiopian,
                      groupValue: _coffeeType,
                      onChanged: (TurkishCoffeeType? value) {
                        setState(() {
                          _coffeeType = value;
                        });
                      },
                    ),
                    RadioListTile<TurkishCoffeeType>(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Brazillian',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      value: TurkishCoffeeType.brazillian,
                      groupValue: _coffeeType,
                      onChanged: (TurkishCoffeeType? value) {
                        setState(() {
                          _coffeeType = value;
                        });
                      },
                    ),
                    aDivider(isVerticalPadding: false),
                  ],
                ),
              ),
              _coffeeType == TurkishCoffeeType.ethiopian
                  ? const EthiopianCoffeeWidget()
                  : const BrazillianCoffeeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
