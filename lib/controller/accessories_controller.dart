import 'package:bayouni_coffee/model/accessory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AccessoriesController extends GetxController {
  var accessoriesList = <AccessoryProduct>[].obs;
  var resultList = <AccessoryProduct>[].obs;
  var searchText = ''.obs;

  var accessoriesFavorites = <AccessoryProduct>[].obs;

  void addToFavorites(String accessoryID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('accessories')
        .update(
      {
        accessoryID: true,
      },
    );
  }

  void removeFromFavorites(String accessoryID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('accessories')
        .child(accessoryID)
        .remove();
  }

  void initLists(AsyncSnapshot<DatabaseEvent> snapshot) {
    accessoriesList.clear();
    resultList.clear();
    Map<dynamic, dynamic> accessoriesMap =
        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

    accessoriesMap.forEach(
      (key, value) =>
          accessoriesList.add(AccessoryProduct.fromRTDB(key: key, data: value)),
    );
    //sorting
    accessoriesList.sort((a, b) => a.order.compareTo(b.order));
    resultList.value = accessoriesList;
  }

  void getResultList(String searchedText) {
    resultList.value = accessoriesList;
    searchText.value = searchedText;
    resultList.value = resultList
        .where((element) =>
            element.name
                .toLowerCase()
                .contains(searchText.value.toLowerCase()) ||
            element.nameAR
                .toLowerCase()
                .contains(searchText.value.toLowerCase()))
        .toList();
    // resultList.forEach((element) {
    //   print(element.name);
    // });
  }
}
