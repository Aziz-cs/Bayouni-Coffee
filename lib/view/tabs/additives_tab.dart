import 'package:bayouni_coffee/view/product_page.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AdditivesTab extends StatelessWidget {
  const AdditivesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const MyTextField(
                iconData: Icons.search, hintText: 'Type something..'),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 26.w,
                  mainAxisSpacing: 17.h,
                  children: List.generate(
                    13,
                    (index) => InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                        pushNewScreen(
                          context,
                          screen: const ProductPage(
                            routedFrom: 'Additives',
                          ),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Placeholder(
                        fallbackHeight: 158.h,
                        fallbackWidth: 158.w,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
