import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index = _carts.indexWhere(
        (element) => element.product.id == product.id,
      );
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(ProductModel product) {
    int index = _carts.indexWhere(
      (element) => element.product.id == product.id,
    );
    _carts.removeAt(index);
    notifyListeners();
  }

  addQuatity(ProductModel product) {
    int index = _carts.indexWhere(
      (element) => element.product.id == product.id,
    );
    _carts[index].quantity++;
    notifyListeners();
  }

  reduceQuantity(ProductModel product) {
    int index = _carts.indexWhere(
      (element) => element.product.id == product.id,
    );
    _carts[index].quantity--;
    if (_carts[index].quantity == 0) {
      _carts.removeAt(index);
    }
    notifyListeners();
  }

  int totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
