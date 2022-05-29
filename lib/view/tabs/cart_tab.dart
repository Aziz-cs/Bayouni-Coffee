import 'package:bayouni_coffee/view/widgets/item_cart.dart';
import 'package:bayouni_coffee/view/widgets/item_fav.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: List.generate(
                2,
                (index) => CartItem(),
              ),
            ),
            SizedBox(height: 10.h),
            TotalVATCart(),
            SizedBox(height: 40.h),
          ],
        ),
      )),
    );
  }
}
