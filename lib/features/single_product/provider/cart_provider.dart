import 'dart:core';

import 'package:flutter/material.dart';

import '../modal/single_product_modal.dart';

class AddToCart extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  set setValue(int constValue) => _value = constValue;
  //increase product number
  void incrementValue() {
    _value++;
    notifyListeners();
  }
  //decrease product number

  void decrementValue() {
    _value--;
    notifyListeners();
  }

  // adding the data to drawer
  final List<SingleProductModal> _cartProducts = [];
  List<SingleProductModal> get cartProducts => _cartProducts;
}
