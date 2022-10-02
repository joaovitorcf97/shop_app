import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavotite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavotite = false,
  });

  void toggleFavorite() {
    isFavotite = !isFavotite;

    notifyListeners();
  }
}
