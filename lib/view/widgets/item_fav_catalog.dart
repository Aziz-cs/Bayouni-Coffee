import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:bayouni_coffee/controller/catalog_controllers/catalog_fav_controller.dart';
import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controller/helper.dart';
import '../accessory_page.dart';

class FavCatalogItem extends StatelessWidget {
  FavCatalogItem({
    Key? key,
    required this.catalogID,
  }) : super(key: key);

  final String catalogID;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 7.h),
      child: FutureBuilder(
        future: FirebaseDatabase.instance
            .ref()
            .child('Catalog')
            .child(catalogID)
            .once(),
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map catalogProductData = snapshot.data!.snapshot.value as Map;
              CatalogProduct catalogProduct = CatalogProduct.fromRTDB(
                  key: catalogID, data: catalogProductData);
              print('has data');
              return InkWell(
                onTap: () {
                  pushNewScreen(
                    context,
                    screen:
                        CatalogController.getCatalogRoutingOf(catalogProduct),
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
                            imageUrl: catalogProduct.imgThumb,
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
                                    Translation.isAr()
                                        ? catalogProduct.nameAR
                                        : catalogProduct.name,
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                    ),
                                  )),
                                  IconButton(
                                      onPressed: () {
                                        FirebaseDatabase.instance
                                            .ref()
                                            .child('Users')
                                            .child(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .child('Favorites')
                                            .child('catalog')
                                            .child(catalogID)
                                            .remove();
                                        showToast('removedFromFavoites'.tr);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.xmark,
                                        color: kBeige,
                                        size: 20,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  catalogProduct.price.toString() +
                                      ' ' +
                                      'sr'.tr,
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
