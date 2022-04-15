import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(CupertinoIcons.back)),
              ],
            ),
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
                  SizedBox(height: 16.h),
                  MyButton(label: 'NEXT TO PROCEED', onPress: () {}),
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
