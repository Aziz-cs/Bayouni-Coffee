import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:bayouni_coffee/view/widgets/item_cart.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class CartTab extends StatelessWidget {
  CartTab({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    cartController.cartOrders.forEach(
      (element) => print(element.selectedDetails),
    );

    cartController.cartOrders.forEach((element) {
      print('name ${element.name}');
      print('price ${element.price}');
      print('selected Details ${element.selectedDetails}');
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    cartController.cartOrders.isEmpty
                        ? Column(
                            children: [
                              SizedBox(height: 40.h),
                              const Icon(
                                CupertinoIcons.cart,
                                size: 110,
                                color: Colors.brown,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'emptyCart'.tr,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.brown,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: MyButton(
                                    label: 'startShopping'.tr,
                                    onPress: () {
                                      currentTabIndex.value = 0;
                                    }),
                              )
                            ],
                          )
                        : Obx(
                            () => Column(
                              children: List.generate(
                                cartController.cartOrders.length,
                                (index) => CartItem(
                                    cartProduct:
                                        cartController.cartOrders[index]),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          TotalVATCart(),
        ],
      )),
    );
  }
}
