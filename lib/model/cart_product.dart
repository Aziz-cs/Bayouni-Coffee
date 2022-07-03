class CartProduct {
  final String name;
  final String nameAR;
  final double price;
  final String imgURL;
  final bool isAccessoryProduct;
  final double kgQuantity;
  final Map<String, String> selectedDetails;
  final Map<String, String> selectedDetailsAR;
  int quantity;
  String comments;
  CartProduct({
    required this.name,
    required this.nameAR,
    required this.price,
    required this.imgURL,
    required this.selectedDetails,
    required this.selectedDetailsAR,
    this.comments = '',
    this.quantity = 1,
    this.isAccessoryProduct = false,
    this.kgQuantity = 0.0,
  });
}
