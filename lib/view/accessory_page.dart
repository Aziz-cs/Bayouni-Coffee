import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/floating_cart.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/accessories_controller.dart';
import '../controller/helper.dart';

class AccessoryProductPage extends StatelessWidget {
  AccessoryProductPage({
    Key? key,
    required this.routedFrom,
    required this.accessoryProduct,
  }) : super(key: key);
  final String routedFrom;
  final AccessoryProduct accessoryProduct;

  final accessoriesController = Get.find<AccessoriesController>();
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
                    Text('Back to $routedFrom'),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            accessoriesController
                                .addToFavorites(accessoryProduct.id);
                            showToast('Added to favorites');
                          },
                          icon: const Icon(
                            CupertinoIcons.heart_circle_fill,
                            color: kBeige,
                            size: 33,
                          ),
                        )
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: accessoryProduct.imgURL,
                      fit: BoxFit.fill,
                      height: 160.h,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      accessoryProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${accessoryProduct.price} SR',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: kBeige,
                          ),
                        ),
                        // RatingBar.builder(
                        //   itemSize: 20.w,
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding:
                        //       const EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      productDesc,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kGrey,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    // MyButton(
                    //   label: 'NEXT TO PROCEED',
                    //   onPress: () => showToast('Demo purpose'),
                    // ),
                  ],
                ),
              ),
              TotalVAT(
                productTitle: accessoryProduct.name,
                productPrice: accessoryProduct.price,
                productIMG: accessoryProduct.imgURL,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(isFromHomePage: false),
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
