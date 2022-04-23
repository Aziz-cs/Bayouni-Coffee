import 'package:bayouni_coffee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'view/start/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Bayouni Coffee',
        theme: ThemeData(
          fontFamily: 'Lato',
          backgroundColor: kGrey,
          unselectedWidgetColor: const Color(0xFFE5E5E5),
          textTheme: TextTheme().copyWith(
            button: TextStyle(fontSize: 45.sp),
            bodyText2: const TextStyle(color: kDarkGrey),
          ),
          primarySwatch: Colors.brown,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
