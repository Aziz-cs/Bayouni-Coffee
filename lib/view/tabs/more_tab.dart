import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/translations/translation.dart';
import 'package:bayouni_coffee/utils/constants.dart';
import 'package:bayouni_coffee/utils/shared_prefs.dart';
import 'package:bayouni_coffee/view/orders_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controller/profile_controller.dart';
import '../widgets/my_textfield.dart';

class MoreTab extends StatelessWidget {
  MoreTab({
    Key? key,
  }) : super(key: key);

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileController.initUserDetails();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Obx(
                  () => Stack(
                    children: [
                      profileController.isUploading.isTrue
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                profileController.pickImage().then((value) =>
                                    profileController.isUploading.value =
                                        false);
                              },
                              child: profileController.imageURL.value.isEmpty
                                  ? CircleAvatar(
                                      maxRadius: 60.w,
                                      backgroundImage: Image.asset(
                                              'assets/images/avatar.png')
                                          .image,
                                    )
                                  : ClipOval(
                                      child: CachedNetworkImage(
                                        height: 130.h,
                                        imageUrl:
                                            profileController.imageURL.value,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset('assets/images/ic_edit.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  FirebaseAuth.instance.currentUser!.email ?? '',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Obx(
                  () => ListTile(
                    onTap: () {
                      final _formKey = GlobalKey<FormState>();
                      var _fullNameContoller = TextEditingController();
                      Get.defaultDialog(
                          title: "Change Username",
                          content: Form(
                            key: _formKey,
                            child: MyTextField(
                              controller: _fullNameContoller,
                              hintText: 'Full name',
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
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                profileController
                                    .updateName(_fullNameContoller.text.trim());
                                showToast('Name has been changed succeffully');
                                Navigator.pop(context);
                              },
                              child: Text('CONFIRM',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('CANCEL',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                            ),
                          ]);
                    },
                    title: Text('name'.tr),
                    subtitle: Text(profileController.userName.value.isEmpty ||
                            profileController.userName.value == 'null'
                        ? 'Not specified'
                        : profileController.userName.value),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(CupertinoIcons.pen),
                  ),
                ),
                const Divider(height: 0),
                Obx(
                  () => ListTile(
                    onTap: () {
                      final _formKey = GlobalKey<FormState>();
                      var _phoneNoController = TextEditingController();
                      Get.defaultDialog(
                          title: "Change Phone No",
                          content: Form(
                            key: _formKey,
                            child: MyTextField(
                              controller: _phoneNoController,
                              textInputType: TextInputType.phone,
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
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                profileController.updatePhoneNo(
                                    _phoneNoController.text.trim());
                                showToast(
                                    'Phone No has been changed succeffully');
                                Navigator.pop(context);
                              },
                              child: Text('CONFIRM',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('CANCEL',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                            ),
                          ]);
                    },
                    title: Text('phoneNo'.tr),
                    subtitle: Text(profileController.phoneNo.value.isEmpty ||
                            profileController.phoneNo.value == 'null'
                        ? 'Not specified'
                        : profileController.phoneNo.value),
                    leading: const Icon(CupertinoIcons.phone_fill),
                    trailing: const Icon(
                      CupertinoIcons.pen,
                    ),
                  ),
                ),
                const Divider(height: 0),
                _buildRowChoice(
                  label: "myOrders".tr,
                  iconData: Icons.checklist_rtl_sharp,
                  onPress: () {
                    pushNewScreen(
                      context,
                      screen: const OrdersPage(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                ),
                // _buildRowChoice(
                //   label: "My Favorite",
                //   iconData: CupertinoIcons.heart,
                //   onPress: () => pushNewScreen(
                //     context,
                //     screen: const OrdersPage(),
                //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                //   ),
                // ),
                // _buildRowChoice(
                //   label: "Delivery",
                //   iconData: Icons.delivery_dining_sharp,
                //   onPress: () => {},
                // ),
                // _buildRowChoice(
                //   label: "Settings",
                //   iconData: CupertinoIcons.settings,
                //   onPress: () => pushNewScreen(
                //     context,
                //     screen: SettingsPage(
                //       routedFrom: "Settings",
                //     ),
                //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                //   ),
                // ),
                _buildRowChoice(
                    label: Translation.isAr() ? 'English' : 'عربي',
                    iconData: Icons.language,
                    onPress: () async {
                      Translation.switchLang();
                    }),
                _buildRowChoice(
                    label: 'logOut'.tr,
                    iconData: Icons.logout_rounded,
                    onPress: () async {
                      SharedPrefs.clearData();
                      await FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowChoice({
    required String label,
    required IconData iconData,
    required VoidCallback onPress,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
          onTap: onPress,
        ),
        const Divider(
          // color: kGrey,
          height: 0,
        ),
      ],
    );
  }
}
