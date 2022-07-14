import 'package:bayouni_coffee/view/widgets/item_accessory.dart';
import 'package:bayouni_coffee/view/widgets/item_fav_accessory.dart';
import 'package:bayouni_coffee/view/widgets/item_fav_catalog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'myFavorites'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kDarkGrey,
                  ),
                ),
              ],
            ),
            _buildDivider(title: 'catalog'.tr),
            Expanded(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref()
                      .child('Users')
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child('Favorites')
                      .child('catalog'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String catalogID = snapshot.key ?? '';
                    print(catalogID);
                    // AccessoryItem favoritedAccessoryItem =
                    return FavCatalogItem(catalogID: catalogID);
                  }),
            ),
            _buildDivider(title: 'accessories'.tr),
            Expanded(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref()
                      .child('Users')
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child('Favorites')
                      .child('accessories'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String accessoryItemID = snapshot.key ?? '';
                    print(accessoryItemID);
                    // AccessoryItem favoritedAccessoryItem =
                    return FavAccessoryItem(
                        accessoryProductID: accessoryItemID);
                  }),
            ),
            // Expanded(
            //   child: Column(children: [
            //     FavItem(
            //       productImg: 'assets/images/catalog_creamy.png',
            //       productPrice: "76",
            //       productTitle: "Manual Espresso / Cappuccino",
            //     ),
            //     FavItem(
            //       productImg: 'assets/images/catalog_tea.png',
            //       productPrice: "76",
            //       productTitle: "Black Tea",
            //     ),
            //     FavItem(
            //       productImg: 'assets/images/catalog_turkish.png',
            //       productPrice: "76",
            //       productTitle: "Turkish Coffee",
            //     ),
            //   ]),
            // ),
          ],
        ),
      )),
    );
  }

  Padding _buildDivider({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            color: kBeige,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
          const Expanded(
              child: Divider(
            color: kBeige,
          )),
        ],
      ),
    );
  }
}
