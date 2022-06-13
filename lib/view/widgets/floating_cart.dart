import 'package:badges/badges.dart';
import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FloatingCart extends StatelessWidget {
  FloatingCart({
    Key? key,
    this.isFromHomePage = true,
  }) : super(key: key);

  bool isFromHomePage;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Badge(
        badgeContent: Text(
          cartController.allCartQuantities.value.toString(),
          // cartController.cartOrders.length.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            currentTabIndex.value = 2;
            if (!isFromHomePage) {
              Get.back();
            }
          },
          backgroundColor: Colors.brown,
          child: const Icon(
            CupertinoIcons.cart,
            size: 25,
          ),
        ),
      ),
    );
  }

  String getCartTotalItems() {
    int cartItemsNo = 0;
    cartController.cartOrders.forEach((element) {
      cartItemsNo += element.quantity;
    });
    return cartItemsNo.toString();
  }
}
