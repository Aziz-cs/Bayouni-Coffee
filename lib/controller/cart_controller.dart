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
    return (totalPurchasePrice.value + vatPrecentage.value).toStringAsFixed(1);
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
    if (isAddedBefore) {
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

  void removeProducFromCart(CartProduct cartProduct) {
    bool isAddedBefore = true;
    CartProduct addedItemBefore = cartOrders.firstWhere(
      (element) => element.name == cartProduct.name,
      orElse: () {
        print('or else');
        isAddedBefore = false;
        return cartProduct;
      },
    );
    if (isAddedBefore) {
      showToast('Is added before');
      addedItemBefore.quantity++;
      allCartQuantities.value++;
      cartOrders.refresh();
      updateTotalPurchasePrice();
    } else {
      showToast('New Entry!');
      cartOrders.add(cartProduct);
      allCartQuantities.value++;
      updateTotalPurchasePrice();
    }
  }

  double getAllTotalWithVAT() {
    return 0;
  }
}
