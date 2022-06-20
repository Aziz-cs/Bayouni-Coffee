import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/model/cart_product.dart';
import 'package:bayouni_coffee/view/accessory_page.dart';
import 'package:bayouni_coffee/view/checkout_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controller/cart_controller.dart';
import '../navigator_page.dart';

class ShoppingButtons extends StatelessWidget {
  ShoppingButtons({
    Key? key,
    required this.productTitle,
    required this.productPrice,
    required this.productIMG,
    this.orderComment = '',
    this.showAddComment = false,
    this.isAccessoryProduct = false,
    this.kgQuantity = 0.0,
  }) : super(key: key);

  final double productPrice;
  final String productTitle;
  final String productIMG;
  final String orderComment;
  final bool isAccessoryProduct;
  final double kgQuantity;
  bool showAddComment;
  final _commentController = TextEditingController();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            if (showAddComment)
              MyTextField(
                controller: _commentController,
                iconData: Icons.comment_outlined,
                hintText: 'Add comment',
                isPrefixIcon: false,
                validator: (input) {
                  if (input!.length > 4000) {
                    return 'Max characters is 4000 ';
                  }
                },
              ),
            MyButton(
              label: 'ADD TO CART',
              onPress: productPrice == 0
                  ? () {
                      showToast('Please select a product to add');
                    }
                  : () {
                      showToast('Added to cart');
                      CartProduct cartProduct = CartProduct(
                        name: productTitle,
                        price: productPrice,
                        comments: orderComment,
                        imgURL: productIMG,
                        quantity: 1,
                        isAccessoryProduct: isAccessoryProduct,
                        kgQuantity: kgQuantity,
                      );
                      cartController.addProductToCart(cartProduct);
                      // if (cartController.cartOrders.c)
                      print('product title: $productTitle');
                      print('product price: $productPrice');
                      print('product image: $productIMG');
                    },
            ),
            SizedBox(height: 9.h),
            MyButton(
              label: 'CONTINUE SHOPPING',
              onPress: () => Navigator.pop(context),
              isFilled: false,
            ),
            SizedBox(height: 9.h),
            MyButton(
                label: 'CHECK OUT',
                onPress: () {
                  currentTabIndex.value = 2;
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}

class TotalVATCart extends StatelessWidget {
  TotalVATCart({Key? key}) : super(key: key);
  final _commentController = TextEditingController();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Purchase Amount',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => Text(
                      cartController.totalPurchasePrice.value
                              .toStringAsFixed(1) +
                          ' SR',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VAT (15%):',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => Text(
                      cartController.vatPrecentage.value.toStringAsFixed(1) +
                          ' SR',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => Text(
                      cartController.getTotalPriceWithVat() + " SR",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // MyTextField(
            //   controller: _commentController,
            //   iconData: Icons.comment_outlined,
            //   hintText: 'Add comment',
            //   isPrefixIcon: false,
            //   validator: (input) {
            //     if (input!.length > 4000) {
            //       return 'Max characters is 4000 ';
            //     }
            //   },
            // ),
            MyButton(
              isDimmed: cartController.cartOrders.isEmpty ? true : false,
              label: 'BUY NOW',
              onPress: () => pushNewScreen(
                context,
                screen: CheckOutPage(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
