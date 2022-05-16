import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/checkout_page.dart';
import 'package:bayouni_coffee/view/orders_page.dart';
import 'package:bayouni_coffee/view/settings_page.dart';
import 'package:bayouni_coffee/view/thanks_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Stack(
                children: [
                  CircleAvatar(
                    maxRadius: 60.w,
                    backgroundImage:
                        Image.asset('assets/images/avatar.png').image,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset('assets/images/ic_edit.png'),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Ahmad Mikael',
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 16.h),
              _buildRowChoice(
                label: "My Information",
                iconData: CupertinoIcons.info_circle,
                onPress: () => {},
              ),
              _buildRowChoice(
                label: "My Orders",
                iconData: Icons.checklist_rtl_sharp,
                onPress: () => pushNewScreen(
                  context,
                  screen: const OrdersPage(),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
              // _buildRowChoice(
              //   label: "My Favorite",
              //   iconData: CupertinoIcons.heart,
              //   onPress: () => pushNewScreen(
              //     context,
              //     screen: const OrdersPage(),
              //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
              //   ),
              // ),
              _buildRowChoice(
                label: "Delivery",
                iconData: Icons.delivery_dining_sharp,
                onPress: () => {},
              ),
              _buildRowChoice(
                label: "Settings",
                iconData: CupertinoIcons.settings,
                onPress: () => pushNewScreen(
                  context,
                  screen: SettingsPage(
                    routedFrom: "Settings",
                  ),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
              Text('----- Demo Purpose -----'),
              _buildRowChoice(
                label: "Check Out Page",
                iconData: Icons.developer_mode,
                onPress: () => pushNewScreen(
                  context,
                  screen: const CheckOutPage(),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
              _buildRowChoice(
                label: "Thank You Page",
                iconData: Icons.developer_mode,
                onPress: () => pushNewScreen(
                  context,
                  screen: const ThanksPage(),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowChoice({
    required String label,
    required IconData iconData,
    required VoidCallback onPress,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
          onTap: onPress,
        ),
        const Divider(
          color: kGrey,
          height: 0,
        ),
      ],
    );
  }
}
