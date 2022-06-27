import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/widgets/floating_cart.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
                    Text('backTo'.tr + ' ' + routedFrom),
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
                        _buildFavIconButton(),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: accessoryProduct.imgURL,
                      fit: BoxFit.fill,
                      height: 160.h,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      Translation.isAr()
                          ? accessoryProduct.nameAR
                          : accessoryProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${accessoryProduct.price} ' + 'sr'.tr,
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
                      Translation.isAr()
                          ? accessoryProduct.discriptionAR
                          : accessoryProduct.discription,
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
              ShoppingButtons(
                productTitle: Translation.isAr()
                    ? accessoryProduct.nameAR
                    : accessoryProduct.name,
                productPrice: accessoryProduct.price,
                productIMG: accessoryProduct.imgURL,
                isAccessoryProduct: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }

  StreamBuilder<DatabaseEvent> _buildFavIconButton() {
    return StreamBuilder(
      stream: FirebaseDatabase.instance
          .ref()
          .child('Favorites')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child('accessories')
          .child(accessoryProduct.id)
          .onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data!.snapshot.value == null) {
            print('is not favorited');
            return IconButton(
                onPressed: () {
                  accessoriesController.addToFavorites(accessoryProduct.id);
                  showToast('addedToFavorites'.tr);
                },
                icon: const Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: kBeige,
                  size: 33,
                ));
          } else {
            print('is favorited');
            return IconButton(
                onPressed: () {
                  accessoriesController
                      .removeFromFavorites(accessoryProduct.id);
                  showToast('Removed from favorites');
                },
                icon: const Icon(
                  CupertinoIcons.heart_circle,
                  color: kBeige,
                  size: 33,
                ));
          }
        }
        return const SizedBox();
      },
    );
  }
}
