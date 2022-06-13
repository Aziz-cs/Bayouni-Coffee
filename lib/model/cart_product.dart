class CartProduct {
  final String name;
  final double price;
  int quantity;
  final String comments;
  final String imgURL;

  CartProduct({
    required this.name,
    required this.price,
    required this.comments,
    required this.imgURL,
    required this.quantity,
  });
}
