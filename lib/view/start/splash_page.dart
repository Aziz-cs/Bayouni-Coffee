import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:bayouni_coffee/view/start/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      FirebaseAuth.instance.authStateChanges().listen((firebaseUser) async {
        await CatalogController.initCatalogPriceList();
        if (firebaseUser != null) {
          print('I am logged in');
          print(firebaseUser.email);
          print(firebaseUser.uid);
          Get.offAll(() => NavigatorPage());
        } else {
          print('I am not logged in');
          Get.offAll(() => LoginPage());
        }
      });
    });
    return Scaffold(
        backgroundColor: const Color(0xFFd3c578),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/bayouni_logo.png',
              width: 105.w,
              height: 106.h,
            ),
            SizedBox(height: 16.h),
            Image.asset(
              'assets/images/bayouni_txt.png',
              width: 230.w,
              height: 118.h,
            ),
          ],
        )
        //  Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       colorFilter: ColorFilter.mode(
        //           Colors.white.withOpacity(0.09), BlendMode.dstATop),
        //       image: const AssetImage(
        //         "assets/images/background.png",
        //       ),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child:
        //     Stack(
        //   children: [
        //     Positioned(
        //       top: 0,
        //       left: 0,
        //       child: Image.asset('assets/images/splash_top_left.png'),
        //     ),
        //     Positioned(
        //       top: 513.h,
        //       left: 0,
        //       child: Image.asset('assets/images/splash_mid_left.png'),
        //     ),
        //     Positioned(
        //       bottom: 0,
        //       left: 0,
        //       child: Image.asset('assets/images/splash_bot_left.png'),
        //     ),
        //     Positioned(
        //       bottom: 0,
        //       right: 0,
        //       child: Image.asset('assets/images/splash_bot_right.png'),
        //     ),
        //     Positioned(
        //       top: 88.5.h,
        //       right: 0,
        //       child: Image.asset('assets/images/splash_bot_right.png'),
        //     ),
        //     Positioned.fill(
        //       top: 290.h,
        //       child: Column(
        //         children: [
        // Image.asset(
        //   'assets/images/bayouni_logo.png',
        //   width: 105.w,
        //   height: 106.h,
        // ),
        // SizedBox(height: 16.h),
        // Image.asset(
        //   'assets/images/bayouni_txt.png',
        //   width: 230.w,
        //   height: 118.h,
        // ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // ),
        );
  }
}
