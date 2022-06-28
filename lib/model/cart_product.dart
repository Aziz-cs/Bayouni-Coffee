class CartProduct {
  final String name;
  final String nameAR;
  final double price;
  final String imgURL;
  final bool isAccessoryProduct;
  final double kgQuantity;
  int quantity;
  String comments;
  CartProduct({
    required this.name,
    required this.nameAR,
    required this.price,
    required this.imgURL,
    this.comments = '',
    this.quantity = 1,
    this.isAccessoryProduct = false,
    this.kgQuantity = 0.0,
  });
}
