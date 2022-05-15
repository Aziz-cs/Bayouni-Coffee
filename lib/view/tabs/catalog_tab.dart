import 'package:bayouni_coffee/view/catalog/additives_page.dart';
import 'package:bayouni_coffee/view/catalog/black_tea_page.dart';
import 'package:bayouni_coffee/view/catalog/flavored_coffee_page.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../catalog/turkish_coffee/turkish_coffee_page.dart';
import '../widgets/item_product.dart';

class CatalogTab extends StatelessWidget {
  const CatalogTab({Key? key}) : super(key: key);

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
                children: [
                  ProductItem(
                    productTitle: 'Turkish coffee',
                    isFavorite: false,
                    imgName: 'catalog_turkish',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const TurkishCoffeePage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Additives',
                    isFavorite: false,
                    imgName: 'catalog_additives',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const AdditivesPage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Arabic coffee',
                    isFavorite: false,
                    imgName: 'catalog_arabic_coffee',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const TurkishCoffeePage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Brewed',
                    isFavorite: false,
                    imgName: 'catalog_brewed',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const TurkishCoffeePage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Espresso',
                    isFavorite: false,
                    imgName: 'catalog_flavored',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const FlavoredCoffeePage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Black tea',
                    isFavorite: false,
                    imgName: 'catalog_tea',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const BlackTeaPage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                  ),
                  ProductItem(
                    productTitle: 'Flavored coffee',
                    isFavorite: false,
                    imgName: 'catalog_flavored',
                    onPress: () => pushNewScreen(
                      context,
                      screen: const FlavoredCoffeePage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
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
