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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFavController {
  static void addToFavorites(String catalogID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('catalog')
        .update(
      {
        catalogID: true,
      },
    );
  }

  static void removeFromFavorites(String catalogID) {
    FirebaseDatabase.instance
        .ref()
        .child('Favorites')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('catalog')
        .child(catalogID)
        .remove();
  }

  // static Widget getPageOfCatalog(CatalogProduct catalogProduct) {
  //   switch (catalogProduct.id) {
  //     case kTurkishCoffeeID:
  //       return TurkishCoffeePage(catalogProduct: catalogProduct);
  //     case kAdditivesID:
  //       return AdditivesPage(catalogProduct: catalogProduct);
  //     case kArabicCoffee:
  //       return ArabicCoffeePage(catalogProduct: catalogProduct);
  //     case kBrewedID:
  //       return BrewedPage(catalogProduct: catalogProduct);
  //     case kEspressoID:
  //       return EspressoPage(catalogProduct: catalogProduct);
  //     case kBlackTea:
  //       return BlackTeaPage(catalogProduct: catalogProduct);
  //     case kCreamyFrenchID:
  //       return CreamyPage(catalogProduct: catalogProduct);
  //     case kFlavoredCoffeeID:
  //       return FlavoredCoffeePage(catalogProduct: catalogProduct);
  //     default:
  //       return LoginPage();
  //   }
  // }
}
