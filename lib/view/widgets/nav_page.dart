import 'package:bayouni_coffee/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:bayouni_coffee/view/tabs/accessories_tab.dart';
import 'package:bayouni_coffee/view/tabs/cart_tab.dart';
import 'package:bayouni_coffee/view/tabs/catalog_tab.dart';
import 'package:bayouni_coffee/view/tabs/favorites_tab.dart';
import 'package:bayouni_coffee/view/tabs/home_tab.dart';
import 'package:bayouni_coffee/view/tabs/more_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavPage extends StatelessWidget {
  NavPage({Key? key}) : super(key: key);
  PersistentTabController? _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animaion on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      CatalogTab(),
      AccessoriesTab(),
      CartTab(),
      const FavoritesTab(),
      MoreTab()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavBarItem(label: 'Catalog', icon: CupertinoIcons.square_grid_2x2),
      _buildNavBarItem(label: 'Accessories', icon: CupertinoIcons.bag),
      _buildNavBarItem(label: 'Cart', icon: CupertinoIcons.cart),
      _buildNavBarItem(label: 'Favorites', icon: CupertinoIcons.heart),
      _buildNavBarItem(label: 'More', icon: CupertinoIcons.profile_circled),
    ];
  }

  PersistentBottomNavBarItem _buildNavBarItem({
    required String label,
    required IconData icon,
  }) {
    return PersistentBottomNavBarItem(
      routeAndNavigatorSettings: RouteAndNavigatorSettings(),
      icon: Icon(icon),
      title: label,
      activeColorPrimary: kBeige,
      inactiveColorPrimary: kGrey,
    );
  }
}
