import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/tabs/additives_tab.dart';
import 'package:bayouni_coffee/view/tabs/cart_tab.dart';
import 'package:bayouni_coffee/view/tabs/catalog_tab.dart';
import 'package:bayouni_coffee/view/tabs/favorites_tab.dart';
import 'package:bayouni_coffee/view/tabs/home_tab.dart';
import 'package:bayouni_coffee/view/tabs/more_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavigatorPage extends StatelessWidget {
  NavigatorPage({Key? key}) : super(key: key);

  final _currentIndex = 0.obs;
  final _tabs = const [
    HomeTab(),
    CatalogTab(),
    AdditivesTab(),
    CartTab(),
    FavoritesTab(),
    MoreTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _tabs[_currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          selectedItemColor: kBeige,
          unselectedItemColor: kGrey,
          currentIndex: _currentIndex.value,
          onTap: (index) => _currentIndex.value = index,
          items: [
            _buildTabItem(
                label: 'Home',
                imgName: 'tab_home',
                isSelected: _currentIndex.value == 0),
            _buildTabItem(
              label: 'Catalog',
              imgName: 'tab_catalog',
              isSelected: _currentIndex.value == 1,
            ),
            _buildTabItem(
              label: 'Additives',
              imgName: 'tab_additives',
              isSelected: _currentIndex.value == 2,
            ),
            _buildTabItem(
              label: 'Cart',
              imgName: 'tab_cart',
              isSelected: _currentIndex.value == 3,
            ),
            _buildTabItem(
              label: 'Favorites',
              imgName: 'tab_favorites',
              isSelected: _currentIndex.value == 4,
            ),
            _buildTabItem(
              label: 'More',
              imgName: 'tab_more',
              isSelected: _currentIndex.value == 0,
            )
          ],
        ),
      ),
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