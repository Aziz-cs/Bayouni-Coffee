import 'package:bayouni_coffee/view/product_page.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../widgets/item_product.dart';

class AccessoriesTab extends StatelessWidget {
  const AccessoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const MyTextField(
                iconData: Icons.search, hintText: 'Type something..'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  24,
                  (index) => ProductItem(
                    productTitle: 'Product ${index + 1}',
                    imgName: 'product$index',
                    isFavorite: false,
                    onPress: () => pushNewScreen(
                      context,
                      screen: const ProductPage(routedFrom: 'Accessories'),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                ),
                //  [
                //   ProductItem(
                //     productTitle: 'Product',
                //     isFavorite: false,
                //     imgName: '',
                // onPress: () => pushNewScreen(
                //   context,
                //   screen: const ProductPage(routedFrom: 'Accessories'),
                //   withNavBar: true, // OPTIONAL VALUE. True by default.
                //   pageTransitionAnimation:
                //       PageTransitionAnimation.cupertino,
                // ),
                //   ),
                // ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
