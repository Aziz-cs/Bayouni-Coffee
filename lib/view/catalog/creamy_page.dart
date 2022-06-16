import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/fav_catalog_btn.dart';
import '../widgets/floating_cart.dart';

class CreamyPage extends StatelessWidget {
  CreamyPage({
    Key? key,
    required this.catalogProduct,
  }) : super(key: key);
  CatalogProduct catalogProduct;
  final _quantity = 1.0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(CupertinoIcons.back),
                      iconSize: 22,
                      padding: EdgeInsets.only(
                        left: 6.w,
                        right: 3.w,
                        bottom: 6.h,
                        top: 6.h,
                      ),
                      constraints: const BoxConstraints(),
                    ),
                    const Text('Back'),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: catalogProduct.imgBig,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    right: 0,
                    child: FavCatalogBtn(catalogID: catalogProduct.id),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catalogProduct.name,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      '${catalogProduct.price} SR',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kBeige,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Made from scartch at our premises',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Ingredients: Coffee, Milk, Hazelnut Flavora and Chocolate',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    aDivider(),
                    QuantityRow(
                      quantity: _quantity,
                    ),
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     Container(
                    //       width: 32.w,
                    //       height: 23.h,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.rectangle,
                    //         border: Border.all(
                    //           color: Colors.black45,
                    //           width: 1.0,
                    //         ),
                    //       ),
                    //       alignment: Alignment.center,
                    //       child: TextField(),
                    //     ),
                    //     SizedBox(width: 57.w),
                    //     Text('G', style: kTxtStyleNormal),
                    //     SizedBox(width: 5.w),
                    //     const Icon(
                    //       Icons.radio_button_unchecked,
                    //       size: 18,
                    //       color: Colors.brown,
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              ShoppingButtons(
                productTitle: catalogProduct.name,
                productPrice: catalogProduct.price,
                productIMG: catalogProduct.imgThumb,
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCart(),
    );
  }
}
