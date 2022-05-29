import 'package:bayouni_coffee/view/widgets/item_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  'My Favorites',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kDarkGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "My Wishlist",
            //       style: TextStyle(
            //         color: kDarkGrey,
            //         fontSize: 16.sp,
            //       ),
            //     ),
            //     Text(
            //       "CHANGE",
            //       style: TextStyle(
            //         color: kBeige,
            //         fontSize: 14.sp,
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: Column(children: [
                FavItem(
                  productImg: 'assets/images/catalog_creamy.png',
                  productPrice: "76",
                  productTitle: "Manual Espresso / Cappuccino",
                ),
                FavItem(
                  productImg: 'assets/images/catalog_tea.png',
                  productPrice: "76",
                  productTitle: "Black Tea",
                ),
                FavItem(
                  productImg: 'assets/images/catalog_turkish.png',
                  productPrice: "76",
                  productTitle: "Turkish Coffee",
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
