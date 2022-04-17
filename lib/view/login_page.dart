import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:bayouni_coffee/view/register_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/my_textfield.dart';
import 'widgets/nav_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/login_bot_left.png'),
          ),
          Positioned(
            top: 72.h,
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
                    Text('Login',
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: const Color(0xFF3A3C40),
                        )),
                    SizedBox(height: 16.h),
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: const Color(0xFF565853),
                                  fontSize: 16.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.bottomSheet(
                                  Container(
                                    height: 0.8.sh,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () => Get.back(),
                                              icon: const Icon(
                                                CupertinoIcons.xmark,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: -25.h,
                                                right: 0,
                                                child: Image.asset(
                                                    'assets/images/forgot_top_right.png'),
                                              ),
                                              Positioned(
                                                bottom: 15.h,
                                                left: 0,
                                                child: Image.asset(
                                                    'assets/images/forgot_bot_left.png'),
                                              ),
                                              Positioned.fill(
                                                  top: 110.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Did you forgot your password?',
                                                          style: TextStyle(
                                                            fontSize: 32.sp,
                                                          ),
                                                        ),
                                                        SizedBox(height: 16.h),
                                                        Text(
                                                          'Please enter your email address you are using for your account bellow and we will send you a password reset link.',
                                                          style: TextStyle(
                                                            fontSize: 16.sp,
                                                            color: kGrey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 16.h),
                                                        const MyTextField(
                                                          hintText: 'Email',
                                                          iconData: Icons
                                                              .mail_outline,
                                                        ),
                                                        SizedBox(height: 16.h),
                                                        MyButton(
                                                          label:
                                                              'REQUEST RESET LINK',
                                                          onPress: () {},
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  ignoreSafeArea: false,
                                ),
                                child: Text(
                                  'Forgot your password?',
                                  style: TextStyle(
                                    color: kBeige,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    MyButton(
                      label: 'LOGIN',
                      onPress: () => Get.offAll(() => NavPage()),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF3A3C40),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildIconBtn(
                      label: 'Login with Facebook',
                      icon: Image.asset('assets/images/ic_facebook.png'),
                    ),
                    SizedBox(height: 16.h),
                    _buildIconBtn(
                      label: 'Login with Google',
                      icon: Image.asset('assets/images/ic_google.png'),
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () => Get.to(() => const RegisterPage()),
                      child: Text(
                        'Don’t have an account? Create one',
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

  ElevatedButton _buildIconBtn({required String label, required Widget icon}) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size.fromHeight(48.h)),
      ),
      onPressed: () {},
      icon: icon,
      label: Text(
        label,
        style: TextStyle(
          color: kGrey,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
