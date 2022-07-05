import 'package:bayouni_coffee/model/cart_product.dart';
import 'package:get/get.dart';

import '../translations/ar.dart';
import '../translations/en.dart';
import 'helper.dart';

Map<String, String> productDetails = {};
Map<String, String> productDetailsAR = {};

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

void addProductDetails({
  required String key,
  required String value,
  bool isCustomized = false,
  bool isEN = true,
}) {
  if (isCustomized && isEN) {
    print('isCustomized && isEN)');
    productDetails[key] = value;
  } else if (isCustomized && !isEN) {
    print('isCustomized && isAR)');

    productDetailsAR[key] = value;
  } else {
    print('else at all)');
    productDetails[en[key]!] = en[value]!;
    productDetailsAR[ar[key]!] = ar[value]!;
  }
}

bool isDetailIsAdded({required String key}) {
  return productDetails.containsKey(en[key]) ||
      productDetailsAR.containsKey(ar[key]);
}

void removeProductDetails({required String key}) {
  productDetails.remove(en[key]);
  productDetailsAR.remove(ar[key]);
}

void clearProductDetails() {
  productDetails.clear();
  productDetailsAR.clear();
}
