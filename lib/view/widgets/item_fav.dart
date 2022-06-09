import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controller/helper.dart';
import '../accessory_page.dart';
import 'my_button.dart';

class FavItem extends StatelessWidget {
  FavItem({
    Key? key,
    required this.accessoryProductID,
  }) : super(key: key);

  final String accessoryProductID;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 7.h),
      child: FutureBuilder(
        future: FirebaseDatabase.instance
            .ref()
            .child('Accessories')
            .child(accessoryProductID)
            .once(),
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map accessoryItemData = snapshot.data!.snapshot.value as Map;
              AccessoryProduct accessoryProduct = AccessoryProduct.fromRTDB(
                  key: accessoryProductID, data: accessoryItemData);
              print('has data');
              return InkWell(
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: AccessoryProductPage(
                      routedFrom: 'Favorites',
                      accessoryProduct: accessoryProduct,
                    ),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: accessoryProduct.imgURL,
                            fit: BoxFit.fill,
                            height: 70.h,
                            width: 70.w,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    accessoryProduct.name,
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                    ),
                                  )),
                                  IconButton(
                                      onPressed: () {
                                        FirebaseDatabase.instance
                                            .ref()
                                            .child('Favorites')
                                            .child(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .child('accessories')
                                            .child(accessoryProductID)
                                            .remove();
                                        showToast('Removed from favorites');
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.xmark,
                                        color: kBeige,
                                        size: 20,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 44.w),
                                child: Text(
                                  "\$${accessoryProduct.price}",
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    color: kBeige,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const Divider(
                    //   color: kGrey,
                    //   height: 1,
                    // ),
                  ],
                ),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
