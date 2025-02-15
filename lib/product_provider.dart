import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  int _quantity;

  ProductProvider(this._quantity);

  int get quantity => _quantity;

  void addToCart() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }
}
