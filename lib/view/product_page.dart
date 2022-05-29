import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/helper.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.routedFrom,
  }) : super(key: key);
  final String routedFrom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Text('Back to $routedFrom'),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Placeholder(
                    fallbackWidth: double.infinity,
                    fallbackHeight: 200.h,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Product Name',
                    style: TextStyle(
                      color: kDarkGrey,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$120',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: kBeige,
                        ),
                      ),
                      RatingBar.builder(
                        itemSize: 20.w,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    productDesc,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: kGrey,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  MyButton(
                    label: 'NEXT TO PROCEED',
                    onPress: () => showToast('Demo purpose'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String productDesc = '''
BAYOUNI’S 50 & 100 cups Percolator Coffee Makers
.Preparation:
 Fill up the coffee pot with unboiled mineral water to the desired level. Add coffee to basket 
.Plug coffee pot into a standard electrical outlet.
 It takes approximately 30 minutes to brew 50 cups of coffee & 55 minutes for 100 cups.
When the coffee has finished brewing, remove the basket.
The pot will keep coffee heated as long as it’s connected to power.
''';
