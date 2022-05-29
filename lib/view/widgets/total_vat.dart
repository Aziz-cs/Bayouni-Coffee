import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/checkout_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TotalVAT extends StatelessWidget {
  TotalVAT({Key? key}) : super(key: key);
  final _commentController = TextEditingController();
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
                    'Purchase Amount:',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SR.',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
                  Text(
                    'SR.',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
                    'Total Amount',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SR.',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
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
              onPress: () => showToast('Added to cart'),
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
              onPress: () => showToast('Demo purpose'),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalVATCart extends StatelessWidget {
  TotalVATCart({Key? key}) : super(key: key);
  final _commentController = TextEditingController();
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
                  // Text(
                  //   '\$160',
                  //   style:
                  //       TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VAT (15%): SR',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'SR',
                  //   style:
                  //       TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Total (VAT)',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$160',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
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
              label: 'BUY NOW',
              onPress: () => pushNewScreen(
                context,
                screen: CheckOutPage(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
            ),
            SizedBox(height: 9.h),
            MyButton(
              label: 'CONTINUE SHOPPING',
              onPress: () => showToast('Demo purpose'),
              isFilled: false,
            ),
          ],
        ),
      ),
    );
  }
}
