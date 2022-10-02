import 'package:app_provider/data/dummy_data.dart';
import 'package:app_provider/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get favoritesItens => [..._items];
  List<Product> get items =>
      _items.where((product) => product.isFavotite).toList();

  void addProduct(Product product) {
    _items.add(product);

    notifyListeners();
  }

  // bool _showFavoriteOnly = false;

  // List<Product> get items {
  //   if (_showFavoriteOnly) {
  //     return _items.where((product) => product.isFavotite).toList();
  //   }

  //   return [..._items];
  // }

  // void showAll() {
  //   _showFavoriteOnly = true;

  //   notifyListeners();
  // }
}
