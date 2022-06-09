// import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
// import 'package:bayouni_coffee/view/widgets/my_textfield.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// import '../widgets/item_product.dart';

// class CatalogTabOld extends StatelessWidget {
//   CatalogTabOld({Key? key}) : super(key: key);
//   final _searchController = TextEditingController();
//   var catalogController = Get.put(CatalogController());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.w),
//         child: Column(
//           children: [
//             SizedBox(height: 10.h),
//             MyTextField(
//               controller: _searchController,
//               iconData: Icons.search,
//               hintText: 'Type something..',
//               validator: (input) {},
//               onChanged: (searchedText) {
//                 catalogController.getResultList(searchedText);
//               },
//             ),
//             Expanded(
//               child: Obx(
//                 () => GridView.count(
//                   crossAxisCount: 2,
//                   children: catalogController.searchText.value.trim().isEmpty
//                       ? List.generate(
//                           catalogProducts.length,
//                           (index) => CatalogItem(
//                               productTitle: catalogProducts[index].name,
//                               isFavorite: false,
//                               imgName: catalogProducts[index].imgName,
//                               onPress: () {
//                                 pushNewScreen(
//                                   context,
//                                   screen: catalogProducts[index].productScreen,
//                                   withNavBar:
//                                       true, // OPTIONAL VALUE. True by default.
//                                   pageTransitionAnimation:
//                                       PageTransitionAnimation.cupertino,
//                                 );
//                                 _searchController.clear();
//                                 catalogController.searchText.value = '';
//                               }),
//                         )
//                       : List.generate(
//                           catalogController.resultList.length,
//                           (index) => CatalogItem(
//                               productTitle:
//                                   catalogController.resultList[index].name,
//                               isFavorite: false,
//                               imgName:
//                                   catalogController.resultList[index].imgName,
//                               onPress: () {
//                                 pushNewScreen(
//                                   context,
//                                   screen: catalogController
//                                       .resultList[index].productScreen,
//                                   withNavBar:
//                                       true, // OPTIONAL VALUE. True by default.
//                                   pageTransitionAnimation:
//                                       PageTransitionAnimation.cupertino,
//                                 );
//                                 _searchController.clear();
//                                 catalogController.searchText.value = '';
//                               }),
//                         ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
