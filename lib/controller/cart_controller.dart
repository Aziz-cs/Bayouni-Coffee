import 'package:bayouni_coffee/model/cart_product.dart';
import 'package:get/get.dart';

import 'helper.dart';

class CartController extends GetxController {
  final cartOrders = <CartProduct>[].obs;

  final allCartQuantities = 0.obs;
  final totalPurchasePrice = 0.0.obs;
  final vatPrecentage = 0.0.obs;

  void updateTotalPurchasePrice() {
    totalPurchasePrice.value = 0;
    for (var cartProduct in cartOrders) {
      totalPurchasePrice.value += cartProduct.price * cartProduct.quantity;
    }
    cartOrders.refresh();
    updateVatPrecentage();
  }

  void updateVatPrecentage() {
    vatPrecentage.value = totalPurchasePrice.value * .15;
  }

  String getTotalPriceWithVat() {
    return (totalPurchasePrice.value + vatPrecentage.value).toStringAsFixed(2);
  }

  void addProductToCart(CartProduct cartProduct) {
    bool isAddedBefore = true;

    CartProduct addedItemBefore = cartOrders.firstWhere(
      (element) => element.name == cartProduct.name,
      orElse: () {
        print('or else');
        isAddedBefore = false;
        return cartProduct;
      },
    );
    if (isAddedBefore && cartProduct.isAccessoryProduct) {
      print('Added before: ${cartProduct.name}');

      addedItemBefore.quantity++;
      allCartQuantities.value++;
      updateTotalPurchasePrice();
    } else {
      print('New entry added: ${cartProduct.name}');
      cartOrders.add(cartProduct);
      allCartQuantities.value++;
      updateTotalPurchasePrice();
    }
  }

  void dismissProductFromCart(CartProduct cartProduct) {
    int quantityOfProduct = cartProduct.quantity;
    cartOrders.removeWhere((element) => element == cartProduct);
    allCartQuantities.value = allCartQuantities.value - quantityOfProduct;
    updateTotalPurchasePrice();
  }

  void decrementProductFromCart(CartProduct cartProduct) {
    cartOrders
        .firstWhere((element) => element.name == cartProduct.name)
        .quantity--;
    allCartQuantities.value--;
    updateTotalPurchasePrice();
  }

  double getAllTotalWithVAT() {
    return 0;
  }
}
