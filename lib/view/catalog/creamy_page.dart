import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreamyPage extends StatefulWidget {
  const CreamyPage({Key? key}) : super(key: key);

  @override
  State<CreamyPage> createState() => _CreamyPageState();
}

class _CreamyPageState extends State<CreamyPage> {
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
                  Image.asset('assets/images/catalog_creamy_big.png'),
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
                      'Creamy French coffee',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Made from scartch at our premises',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Ingredients: Coffee, Milk, Hazelnut Flavora and Chocolate',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    aDivider(),
                    QuantityRow(
                      quantity: _quantity,
                    ),
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     Container(
                    //       width: 32.w,
                    //       height: 23.h,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.rectangle,
                    //         border: Border.all(
                    //           color: Colors.black45,
                    //           width: 1.0,
                    //         ),
                    //       ),
                    //       alignment: Alignment.center,
                    //       child: TextField(),
                    //     ),
                    //     SizedBox(width: 57.w),
                    //     Text('G', style: kTxtStyleNormal),
                    //     SizedBox(width: 5.w),
                    //     const Icon(
                    //       Icons.radio_button_unchecked,
                    //       size: 18,
                    //       color: Colors.brown,
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 10.h),
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
