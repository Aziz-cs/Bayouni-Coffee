import 'package:bayouni_coffee/constants.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/brazillian_coffee_widget%20copy.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/ethiopian_coffee_widget.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:bayouni_coffee/view/widgets/quantity_row.dart';
import 'package:bayouni_coffee/view/widgets/total_vat.dart';
import 'package:bayouni_coffee/view/widgets/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BlackTeaType { box, bag }
enum GreenTeaType { green, none }
enum ShakerTeaType { shakir, none }
enum OtherTeaType { other, none }

class BlackTeaPage extends StatefulWidget {
  const BlackTeaPage({Key? key}) : super(key: key);

  @override
  State<BlackTeaPage> createState() => _BlackTeaPageState();
}

class _BlackTeaPageState extends State<BlackTeaPage> {
  BlackTeaType _blackTeaType = BlackTeaType.box;
  GreenTeaType _greenTeaType = GreenTeaType.none;
  ShakerTeaType _shakerTeaType = ShakerTeaType.none;
  OtherTeaType _otherTeaType = OtherTeaType.none;
  final int _quanitity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                      left: 6.w,
                      right: 3.w,
                      bottom: 6.h,
                      top: 6.h,
                    ),
                    constraints: const BoxConstraints(),
                  ),
                  const Text('Back to Catalog'),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Stack(
              children: [
                Image.asset('assets/images/catalog_additives_big.png'),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.heart_circle_fill,
                      color: Colors.white,
                      size: 29,
                    ),
                    onPressed: () {
                      showToast('Added to favorites');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Tea',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  aDivider(),
                  Text(
                    'Bayouni Black Tea',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'Good quality black Kenyan tea',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  RadioListTile<BlackTeaType>(
                    dense: true,
                    title: Text(
                      'Box (2 x 750gms)',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      'SR. 42.00',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    value: BlackTeaType.box,
                    groupValue: _blackTeaType,
                    onChanged: (value) {
                      setState(() {
                        _blackTeaType = value ?? BlackTeaType.box;
                      });
                    },
                  ),
                  RadioListTile<BlackTeaType>(
                    dense: true,
                    title: Text(
                      'Bag (1 x 750gms)',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      'SR. 21.00',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    value: BlackTeaType.bag,
                    groupValue: _blackTeaType,
                    onChanged: (value) {
                      setState(() {
                        _blackTeaType = value ?? BlackTeaType.box;
                      });
                    },
                  ),
                  QuantityRow(quantity: _quanitity),
                  aDivider(),
                  RadioListTile<GreenTeaType>(
                    toggleable: true,
                    dense: true,
                    title: Text(
                      'Green Tea',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      'SR. 54.00 / kg',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    value: GreenTeaType.none,
                    groupValue: _greenTeaType,
                    onChanged: (value) {
                      if (value == GreenTeaType.green) {
                        setState(() {
                          _greenTeaType = GreenTeaType.none;
                        });
                      } else {
                        setState(() {
                          _greenTeaType = value ?? GreenTeaType.green;
                        });
                      }
                    },
                  ),
                  QuantityRow(quantity: _quanitity),
                  aDivider(),
                  RadioListTile<ShakerTeaType>(
                    toggleable: true,
                    dense: true,
                    title: Text(
                      'Shakir Tea 500gms',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      'SR. 65.00 / can',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    value: ShakerTeaType.none,
                    groupValue: _shakerTeaType,
                    onChanged: (value) {
                      if (value == ShakerTeaType.shakir) {
                        setState(() {
                          _shakerTeaType = ShakerTeaType.none;
                        });
                      } else {
                        setState(() {
                          _shakerTeaType = value ?? ShakerTeaType.shakir;
                        });
                      }
                    },
                  ),
                  QuantityRow(quantity: _quanitity),
                  aDivider(),
                  RadioListTile<OtherTeaType>(
                    toggleable: true,
                    dense: true,
                    title: Text(
                      'Other Tea',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      'SR. 65.00 / can',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    value: OtherTeaType.none,
                    groupValue: _otherTeaType,
                    onChanged: (value) {
                      if (value == OtherTeaType.other) {
                        setState(() {
                          _otherTeaType = OtherTeaType.none;
                        });
                      } else {
                        setState(() {
                          _otherTeaType = value ?? OtherTeaType.other;
                        });
                      }
                    },
                  ),
                  QuantityRow(quantity: _quanitity),
                  aDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
