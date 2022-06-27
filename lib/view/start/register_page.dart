import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/start/login_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth.dart';
import '../../utils/shared_prefs.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _fullNameContoller = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confrimPasswordController = TextEditingController();

  final authController = Get.find<AuthController>();
  final isAcceptedPrivacy = false.obs;
  @override
  Widget build(BuildContext context) {
    print(sharedPrefs.imageURL);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.h),
                      Image.asset(
                        'assets/images/bayouni_logo.png',
                        width: 70.w,
                      ),
                      Text('registeration'.tr,
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: const Color(0xFF3A3C40),
                          )),
                      SizedBox(height: 16.h),
                      MyTextField(
                        controller: _fullNameContoller,
                        hintText: 'fullName'.tr,
                        iconData: CupertinoIcons.person,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return kErrorEmpty;
                          }
                          if (input.length < 2) {
                            return 'Too short';
                          }
                        },
                      ),
                      // const MyTextField(
                      //   hintText: 'Last name',
                      //   iconData: CupertinoIcons.pen,
                      // ),
                      MyTextField(
                        controller: _phoneNoController,
                        hintText: 'phoneNo'.tr,
                        iconData: CupertinoIcons.phone,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return kErrorEmpty;
                          }
                          if (!GetUtils.isPhoneNumber(input)) {
                            return kErrorPhone;
                          }
                        },
                      ),
                      MyTextField(
                        controller: _emailController,
                        hintText: 'email'.tr,
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
                        hintText: 'password'.tr,
                        isObscure: true,
                        iconData: CupertinoIcons.padlock,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return kErrorEmpty;
                          }
                          if (input.length < 6) {
                            return 'The password should be six letters or more';
                          }
                        },
                      ),
                      MyTextField(
                        controller: _confrimPasswordController,
                        hintText: 'confirmPassword'.tr,
                        isObscure: true,
                        iconData: CupertinoIcons.padlock,
                        validator: (input) {
                          if (input!.trim() !=
                              _passwordController.text.trim()) {
                            return 'The passwords are not the same';
                          }
                        },
                      ),
                      Obx(
                        () => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isAcceptedPrivacy.value,
                          onChanged: (_) {
                            isAcceptedPrivacy.value = !isAcceptedPrivacy.value;
                          },
                          title: Text(
                            'acceptPrivacy'.tr,
                            style: TextStyle(
                              color: const Color(0xFF565853),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),
                      //elevated
                      Obx(
                        () => authController.isLoadingEmail.isTrue
                            ? const CircularProgressIndicator()
                            : MyButton(
                                label: 'register'.tr,
                                onPress: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  if (!isAcceptedPrivacy.value) {
                                    showToast(
                                        'You need to accept our privacy policy before registeration');
                                    return;
                                  }
                                  authController.createUser(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    name: _fullNameContoller.text.trim(),
                                    phoneNo: _phoneNoController.text.trim(),
                                  );
                                },
                              ),
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () => Get.to(() => LoginPage()),
                        child: Text(
                          'alreadyHaveAccount'.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: kDarkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Stack(
            //   children: [

            // Positioned(
            //   top: 182.h,
            //   left: 152.w,
            //   child: Image.asset(
            //     'assets/images/bayouni_logo.png',
            //     width: 70.w,
            //   ),
            // ),

            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
