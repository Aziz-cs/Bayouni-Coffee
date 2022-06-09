import 'package:bayouni_coffee/controller/accessories_controller.dart';
import 'package:bayouni_coffee/model/accessory.dart';
import 'package:bayouni_coffee/view/widgets/item_accessory.dart';
import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccessoriesTab extends StatelessWidget {
  AccessoriesTab({Key? key}) : super(key: key);
  final _searchController = TextEditingController();
  final accessoriesController = Get.put(AccessoriesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            MyTextField(
              controller: _searchController,
              iconData: Icons.search,
              hintText: 'Type something..',
              validator: (input) {},
              onChanged: (searchedText) {
                accessoriesController.getResultList(searchedText);
              },
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .ref()
                    .child('Accessories')
                    .orderByChild('order')
                    .onValue,
                builder: (BuildContext context,
                    AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    if (snapshot.hasData) {
                      accessoriesController.initLists(snapshot);
                      return Obx(
                        () => GridView.count(
                          crossAxisCount: 2,
                          children: accessoriesController.searchText.value
                                  .trim()
                                  .isEmpty
                              ? List.generate(
                                  accessoriesController.accessoriesList.length,
                                  (index) => AccessoryItem(
                                    accessory: accessoriesController
                                        .accessoriesList[index],
                                  ),
                                )
                              : List.generate(
                                  accessoriesController.resultList.length,
                                  (index) => AccessoryItem(
                                    accessory:
                                        accessoriesController.resultList[index],
                                  ),
                                ),
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
