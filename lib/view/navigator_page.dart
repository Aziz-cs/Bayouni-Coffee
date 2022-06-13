import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/tabs/accessories_tab.dart';
import 'package:bayouni_coffee/view/tabs/cart_tab.dart';
import 'package:bayouni_coffee/view/tabs/catalog_tab.dart';
import 'package:bayouni_coffee/view/tabs/favorites_tab.dart';
import 'package:bayouni_coffee/view/tabs/more_tab.dart';
import 'package:bayouni_coffee/view/widgets/floating_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

final currentTabIndex = 0.obs;

class NavigatorPage extends StatelessWidget {
  NavigatorPage({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());

  final _tabs = [
    CatalogTab(),
    AccessoriesTab(),
    CartTab(),
    const FavoritesTab(),
    MoreTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _tabs[currentTabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          selectedItemColor: kBeige,
          unselectedItemColor: kGrey,
          currentIndex: currentTabIndex.value,
          onTap: (index) => currentTabIndex.value = index,
          items: [
            _buildTabItem(
              label: 'Catalog',
              imgName: 'tab_catalog',
              isSelected: currentTabIndex.value == 0,
            ),
            _buildTabItem(
              label: 'Accessories',
              imgName: 'tab_additives',
              isSelected: currentTabIndex.value == 1,
            ),
            _buildTabItem(
              label: 'Cart',
              imgName: 'tab_cart',
              isSelected: currentTabIndex.value == 2,
            ),
            _buildTabItem(
              label: 'Favorites',
              imgName: 'tab_favorites',
              isSelected: currentTabIndex.value == 3,
            ),
            _buildTabItem(
              label: 'More',
              imgName: 'tab_more',
              isSelected: currentTabIndex.value == 4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }

  BottomNavigationBarItem _buildTabItem({
    required String label,
    required String imgName,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Image.asset(
          'assets/images/$imgName.png',
          width: 23.w,
          height: 23.h,
          color: isSelected ? kBeige : kGrey,
        ),
      ),
    );
  }
}
