import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/start/login_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/login_top_left.png'),
          ),
          Positioned(
            top: 66.h,
            right: 0,
            child: Image.asset('assets/images/login_top_right.png'),
          ),
          Positioned(
            top: 182.h,
            left: 152.w,
            child: Image.asset(
              'assets/images/bayouni_logo.png',
              width: 70.w,
            ),
          ),
          Positioned.fill(
              top: 260.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Registeration',
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: const Color(0xFF3A3C40),
                        )),
                    SizedBox(height: 16.h),
                    const MyTextField(
                      hintText: 'Name',
                      iconData: CupertinoIcons.person,
                    ),
                    const MyTextField(
                      hintText: 'Last name',
                      iconData: CupertinoIcons.pen,
                    ),
                    const MyTextField(
                      hintText: 'Phone number',
                      iconData: CupertinoIcons.phone,
                    ),
                    const MyTextField(
                      hintText: 'Email',
                      iconData: Icons.mail_outline,
                    ),
                    const MyTextField(
                      hintText: 'Password',
                      iconData: CupertinoIcons.padlock,
                    ),

                    Row(
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.h,
                          color: Colors.white,
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'I accept the privacy policy',
                          style: TextStyle(
                            color: const Color(0xFF565853),
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    //elevated
                    MyButton(
                      label: 'REGISTER',
                      onPress: () {},
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () => Get.to(() => const LoginPage()),
                      child: Text(
                        'I already have an account',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: kDarkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
