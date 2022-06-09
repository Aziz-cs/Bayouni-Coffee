import 'package:bayouni_coffee/controller/catalog_controllers/catalog_controller.dart';
import 'package:flutter/material.dart';

// CatalogProduct(
//   id: 'turkishCoffee',
//   name: 'Turkish coffee',
//   nameAR: '',
//   price: 100,
//   imgName: 'catalog_turkish',
//   productScreen: TurkishCoffeePage(),
//   catalogEnum: CatalogEnum.turkishCoffee,
// ),
class CatalogProduct {
  String id;
  String name;
  String nameAR;
  String desc;
  String descAr;
  double price;
  String imgThumb;
  String imgBig;
  int order;

  CatalogProduct({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.price,
    required this.desc,
    required this.descAr,
    required this.imgBig,
    required this.imgThumb,
    required this.order,
  });

  factory CatalogProduct.fromRTDB({
    required String key,
    required Map data,
  }) {
    return CatalogProduct(
      id: key,
      name: data['name'],
      nameAR: data['nameAR'],
      desc: data['desc'],
      descAr: data['descAR'],
      price: double.parse(data['price'].toString()),
      imgThumb: data['imgThumb'],
      imgBig: data['imgBig'],
      order: data['order'],
    );
  }
}
