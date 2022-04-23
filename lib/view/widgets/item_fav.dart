import 'package:bayouni_coffee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavItem extends StatelessWidget {
  const FavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/product_item1.png',
          width: 160.w,
          height: 160.h,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    "Manual Espresso / Cappuccino",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )),
                ],
              ),
              SizedBox(height: 12.h),
              RatingBar.builder(
                itemSize: 20.w,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                // itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 12.h),
              Text(
                "\$76",
                style: TextStyle(
                  color: kBeige,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
