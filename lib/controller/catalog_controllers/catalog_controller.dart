import 'package:bayouni_coffee/controller/catalog_controllers/additives_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:bayouni_coffee/model/catalog_product.dart';
import 'package:bayouni_coffee/view/catalog/additives_page.dart';
import 'package:bayouni_coffee/view/catalog/arabic_coffee_page.dart';
import 'package:bayouni_coffee/view/catalog/black_tea_page.dart';
import 'package:bayouni_coffee/view/catalog/brewed_page.dart';
import 'package:bayouni_coffee/view/catalog/creamy_page.dart';
import 'package:bayouni_coffee/view/catalog/espresso_page.dart';
import 'package:bayouni_coffee/view/catalog/flavored_coffee_page.dart';
import 'package:bayouni_coffee/view/catalog/turkish_coffee/turkish_coffee_page.dart';
import 'package:bayouni_coffee/view/start/login_page.dart';

enum CatalogEnum {
  turkishCoffee,
  additives,
  arabicCoffee,
  brewed,
  espresso,
  blackTea,
  creamyFrench,
  flavoredCoffee
}

Map<dynamic, dynamic> catalogPriceList = {};

const String kTurkishCoffeeID = "turkishCoffee";
const String kAdditivesID = "additives";
const String kArabicCoffee = "arabicCoffee";
const String kBrewedID = "brewed";
const String kEspressoID = "espresso";
const String kBlackTea = "blackTea";
const String kCreamyFrenchID = "creamyFrench";
const String kFlavoredCoffeeID = "flavoredCoffee";

// class CatalogController extends GetxController {
//   var resultList = <CatalogProduct>[].obs;
//   var searchText = ''.obs;

//   void getResultList({
//     required String searchedText,
//     required List<CatalogProduct> catalogProducts,
//   }) {
//     resultList.value = catalogProducts;
//     searchText.value = searchedText;
//     resultList.value = resultList
//         .where((element) =>
//             element.name
//                 .toLowerCase()
//                 .contains(searchText.value.toLowerCase()) ||
//             element.nameAR
//                 .toLowerCase()
//                 .contains(searchText.value.toLowerCase()))
//         .toList();
//     // resultList.forEach((element) {
//     //   print(element.name);
//     // });
//   }
// }

class CatalogController extends GetxController {
  var catalogProductsList = <CatalogProduct>[].obs;
  var resultList = <CatalogProduct>[].obs;
  var searchText = ''.obs;

  var accessoriesFavorites = <CatalogProduct>[].obs;

  void addToFavorites(String catalogProductID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('catalog')
        .update(
      {
        catalogProductID: true,
      },
    );
  }

  void removeFromFavorites(String catalogProductID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('catalog')
        .child(catalogProductID)
        .remove();
  }

  void initLists(AsyncSnapshot<DatabaseEvent> snapshot) {
    catalogProductsList.clear();
    resultList.clear();
    Map<dynamic, dynamic> accessoriesMap =
        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

    accessoriesMap.forEach(
      (key, value) => catalogProductsList
          .add(CatalogProduct.fromRTDB(key: key, data: value)),
    );
    //sorting
    catalogProductsList.sort((a, b) => a.order.compareTo(b.order));
    resultList.value = catalogProductsList;
  }

  void getResultList(String searchedText) {
    resultList.value = catalogProductsList;
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

  static Widget getCatalogRoutingOf(CatalogProduct catalogProduct) {
    switch (catalogProduct.id) {
      case kTurkishCoffeeID:
        return TurkishCoffeePage(catalogProduct: catalogProduct);
      case kAdditivesID:
        return AdditivesPage(catalogProduct: catalogProduct);
      case kArabicCoffee:
        return ArabicCoffeePage(catalogProduct: catalogProduct);
      case kBrewedID:
        return BrewedPage(catalogProduct: catalogProduct);
      case kEspressoID:
        return EspressoPage(catalogProduct: catalogProduct);
      case kBlackTea:
        return BlackTeaPage(catalogProduct: catalogProduct);
      case kCreamyFrenchID:
        return CreamyPage(catalogProduct: catalogProduct);
      case kFlavoredCoffeeID:
        return FlavoredCoffeePage(catalogProduct: catalogProduct);
      default:
        return Container();
    }
  }

  static Future<void> initCatalogPriceList() async {
    FirebaseDatabase.instance
        .ref()
        .child('CatalogPriceList')
        .onValue
        .listen((event) {
      catalogPriceList = event.snapshot.value as Map;
      print('catalogPricelist: $catalogPriceList');

      AdditivesController.initAdditivesPrices();
    });
  }
}

// final catalogProducts = <CatalogProduct>[
//   CatalogProduct(
//     id: kTurkishCoffeeID,
//     name: 'Turkish coffee',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_turkish',
//     productScreen: TurkishCoffeePage(catalogID: kTurkishCoffeeID),
//     catalogEnum: CatalogEnum.turkishCoffee,
//   ),
//   CatalogProduct(
//     id: kAdditivesID,
//     name: 'Additives',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_additives',
//     productScreen: AdditivesPage(catalogID: kAdditivesID),
//     catalogEnum: CatalogEnum.additives,
//   ),
//   CatalogProduct(
//     id: 'arabicCoffee',
//     name: 'Arabic coffee',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_arabic_coffee',
//     productScreen: ArabicCoffeePage(),
//     catalogEnum: CatalogEnum.arabicCoffee,
//   ),
//   CatalogProduct(
//     id: 'brewed',
//     name: 'Brewed',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_brewed',
//     productScreen: BrewedPage(),
//     catalogEnum: CatalogEnum.brewed,
//   ),
//   CatalogProduct(
//     id: 'espresso',
//     name: 'Espresso',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_flavored',
//     productScreen: EspressoPage(),
//     catalogEnum: CatalogEnum.espresso,
//   ),
//   CatalogProduct(
//     id: 'blackTea',
//     name: 'Black tea',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_turkish',
//     productScreen: const BlackTeaPage(),
//     catalogEnum: CatalogEnum.blackTea,
//   ),
//   CatalogProduct(
//     id: 'creamyFrench',
//     name: 'Creamy French',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_creamy',
//     productScreen: const CreamyPage(),
//     catalogEnum: CatalogEnum.creamyFrench,
//   ),
//   CatalogProduct(
//     id: 'flavoredCoffee',
//     name: 'Flavored coffee',
//     nameAR: '',
//     price: 100,
//     imgName: 'catalog_flavored',
//     productScreen: const FlavoredCoffeePage(),
//     catalogEnum: CatalogEnum.flavoredCoffee,
//   ),
// ];
