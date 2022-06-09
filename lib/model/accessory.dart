import 'package:flutter/foundation.dart';

class AccessoryProduct {
  String id;
  String name;
  String nameAR;
  String discription;
  String discriptionAR;
  double price;
  String imgURL;
  int order;

  AccessoryProduct({
    required this.id,
    required this.name,
    required this.nameAR,
    required this.discription,
    required this.discriptionAR,
    required this.price,
    required this.imgURL,
    required this.order,
  });

  factory AccessoryProduct.fromRTDB({
    required String key,
    required Map data,
  }) {
    return AccessoryProduct(
      id: key,
      name: data['name'],
      nameAR: data['nameAR'],
      discription: data['discription'],
      discriptionAR: data['discriptionAR'],
      price: double.parse(data['price'].toString()),
      imgURL: data['imgURL'],
      order: data['order'],
    );
  }
}
