import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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
