import 'dart:math';

import 'package:app_provider/models/cart_item.dart';
import 'package:app_provider/models/product.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, carItem) {
      total += carItem.price * carItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (item) => CartItem(
            id: item.id,
            productId: item.productId,
            name: item.name,
            quantity: item.quantity,
            price: item.price,
            imageUrl: item.imageUrl),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
          imageUrl: product.imageUrl,
        ),
      );
    }

    notifyListeners();
  }

  void clear() {
    _items = {};

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);

    notifyListeners();
  }
}
