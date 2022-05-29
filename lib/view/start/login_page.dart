import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:bayouni_coffee/view/start/register_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth.dart';
import '../widgets/my_textfield.dart';
import '../widgets/nav_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailForgotController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = Get.put(AuthController());
  final _isRememberMe = true.obs;
  @override
  Widget build(BuildContext context) {
    authController.isLoadingGoogle.value = false;
    print(authController.isLoadingGoogle.value);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Login',
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: const Color(0xFF3A3C40),
                          )),
                      SizedBox(height: 16.h),
                      MyTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        iconData: Icons.mail_outline,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return kErrorEmpty;
                          }
                          if (!GetUtils.isEmail(input)) {
                            return kErrorEmail;
                          }
                        },
                      ),
                      MyTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        iconData: CupertinoIcons.padlock,
                        isObscure: true,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return kErrorEmpty;
                          }
                          if (input.length < 6) {
                            return 'Password is too short';
                          }
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  _isRememberMe.value = !_isRememberMe.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    color: Colors.white,
                                    child: Obx(
                                      () => Checkbox(
                                        value: _isRememberMe.value,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: const Color(0xFF565853),
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                                padding: EdgeInsets.symmetric(
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
                                                    MyTextField(
                                                      controller:
                                                          _emailForgotController,
                                                      hintText: 'Email',
                                                      iconData:
                                                          Icons.mail_outline,
                                                      validator: (input) {
                                                        if (input!.isEmpty) {
                                                          return kErrorEmpty;
                                                        }
                                                        if (!GetUtils.isEmail(
                                                            input)) {
                                                          return kErrorEmail;
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(height: 16.h),
                                                    Obx(
                                                      () => authController
                                                              .isLoadingForgotPass
                                                              .isTrue
                                                          ? const CircularProgressIndicator()
                                                          : MyButton(
                                                              label:
                                                                  'REQUEST RESET LINK',
                                                              onPress: () {
                                                                print(
                                                                    _emailForgotController
                                                                        .text
                                                                        .trim());
                                                                authController
                                                                    .sendResetPasswordMail(
                                                                        email: _emailForgotController
                                                                            .text
                                                                            .trim());
                                                              },
                                                            ),
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
                      SizedBox(height: 16.h),
                      Obx(
                        () => authController.isLoadingEmail.isTrue
                            ? const CircularProgressIndicator()
                            : MyButton(
                                label: 'LOGIN',
                                onPress: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  print(_emailController.text.trim());
                                  authController.signInWithEmailNPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                                },
                              ),
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
                      Obx(
                        () => authController.isLoadingFacebook.isTrue
                            ? const CircularProgressIndicator()
                            : _buildIconBtn(
                                label: 'Login with Facebook',
                                icon: Image.asset(
                                    'assets/images/ic_facebook.png'),
                                onPress: () {
                                  authController.signInWithFacebook();
                                },
                              ),
                      ),
                      SizedBox(height: 16.h),
                      Obx(
                        () => authController.isLoadingGoogle.value
                            ? const CircularProgressIndicator()
                            : _buildIconBtn(
                                label: 'Login with Google',
                                icon:
                                    Image.asset('assets/images/ic_google.png'),
                                onPress: () {
                                  authController.signInWithGoogle();
                                }),
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () => Get.to(() => RegisterPage()),
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
                ),
              )),
        ],
      ),
    );
  }

  ElevatedButton _buildIconBtn({
    required String label,
    required Widget icon,
    required VoidCallback onPress,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(kBeige),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size.fromHeight(48.h)),
      ),
      onPressed: onPress,
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
