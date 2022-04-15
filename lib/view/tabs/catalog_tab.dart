import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../product_page.dart';

class CatalogTab extends StatelessWidget {
  const CatalogTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
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
                      onTap: () => Get.to(() => const ProductPage()),
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
