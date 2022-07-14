import 'package:bayouni_coffee/controller/catalog_controllers/catalog_fav_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/helper.dart';
import '../../utils/constants.dart';

class FavCatalogBtn extends StatelessWidget {
  const FavCatalogBtn({
    Key? key,
    required this.catalogID,
  }) : super(key: key);
  final String catalogID;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseDatabase.instance
          .ref()
          .child('Users')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child('Favorites')
          .child('catalog')
          .child(catalogID)
          .onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data!.snapshot.value == null) {
            print('is not favorited');
            return IconButton(
                onPressed: () {
                  CatalogFavController.addToFavorites(catalogID);
                  showToast('Added to favorites');
                },
                icon: const Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: kBeige,
                  size: 33,
                ));
          } else {
            print('is favorited');
            return IconButton(
                onPressed: () {
                  CatalogFavController.removeFromFavorites(catalogID);
                  showToast('Removed from favorites');
                },
                icon: const Icon(
                  CupertinoIcons.heart_circle,
                  color: kBeige,
                  size: 33,
                ));
          }
        }
        return const SizedBox();
      },
    );
  }
}
