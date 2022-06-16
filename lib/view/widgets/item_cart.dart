import 'package:bayouni_coffee/controller/cart_controller.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/model/cart_product.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    // required this.cartProduct,
    required this.cartProduct,
  }) : super(key: key);
  final CartProduct cartProduct;

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      margin: EdgeInsets.only(bottom: 15.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 90.w,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: cartProduct.imgURL,
                        fit: BoxFit.fill,
                        height: 70.h,
                        width: 70.w,
                      ),
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          cartProduct.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              cartController
                                  .dismissProductFromCart(cartProduct);
                              showToast('Removed from cart');
                            },
                            icon: const Icon(
                              CupertinoIcons.xmark,
                              size: 17,
                            ))
                      ],
                    ),
                    Text(
                      (cartProduct.price * cartProduct.quantity).toString() +
                          " SR",
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: kBeige,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    cartProduct.isAccessoryProduct
                        ? Row(
                            children: [
                              IconButton(
                                  splashColor: kBeige,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    cartController
                                        .addProductToCart(cartProduct);
                                    // cartProduct.quantity++;
                                    // cartController.allCartQuantities.value++;
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.add,
                                    size: 19,
                                  )),
                              SizedBox(width: 17.w),
                              Obx(
                                () => Text(
                                  cartController.cartOrders
                                      .firstWhere((element) =>
                                          cartProduct.name == element.name)
                                      .quantity
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 17.w),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    if (cartProduct.quantity > 1) {
                                      cartController.decrementProductFromCart(
                                          cartProduct);
                                    }
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.minus,
                                    size: 19,
                                  ))
                            ],
                          )
                        : Text(
                            '${cartProduct.kgQuantity} KG',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: kGrey,
            height: 1,
          ),
          // SizedBox(height: 13.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'VAT Included',
          //       style: TextStyle(
          //         fontSize: 15.sp,
          //       ),
          //     ),
          //     Text(
          //       '\$76',
          //       style: TextStyle(
          //         color: kBeige,
          //         fontSize: 15.sp,
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(height: 13.h),
        ],
      ),
    );
  }
}
