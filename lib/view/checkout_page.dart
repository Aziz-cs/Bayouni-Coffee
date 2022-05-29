import 'package:bayouni_coffee/view/thanks_page.dart';
import 'package:bayouni_coffee/view/widgets/my_button.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../utils/constants.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({Key? key}) : super(key: key);
  final _fullNameContoller = TextEditingController();
  final _phoneNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(CupertinoIcons.back),
                      iconSize: 22,
                      padding: EdgeInsets.only(
                        left: 0,
                        right: 3.w,
                        bottom: 6.h,
                        top: 6.h,
                      ),
                      constraints: BoxConstraints(),
                    ),
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.h),
              MyTextField(
                controller: _fullNameContoller,
                iconData: CupertinoIcons.person,
                hintText: 'Full name',
                validator: (input) {
                  if (input!.isEmpty) {
                    return kErrorEmpty;
                  }
                },
              ),
              MyTextField(
                controller: _phoneNoController,
                iconData: CupertinoIcons.phone,
                hintText: 'Phone number',
                validator: (input) {
                  if (input!.isEmpty) {
                    return kErrorEmpty;
                  }
                },
              ),
              Container(
                width: double.infinity,
                height: 43.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                    )),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.location,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  isDense: true,
                  value: 'New York',
                  isExpanded: true,
                  alignment: Alignment.center,
                  items: <String>[
                    'New York',
                    'Los Angeles',
                    'Houston',
                    'Phoenix',
                    'Philadelphia',
                    'San Antonio',
                    'San Diego',
                    'Dallas',
                    'Columbus',
                    'Seattle',
                    'Washington',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
              const Spacer(),
              MyButton(
                label: 'CONTINUE',
                onPress: () => pushNewScreen(
                  context,
                  screen: const ThanksPage(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
