import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/product_list.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;
  const ProductGrid({
    Key? key,
    required this.showFavoriteOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadProducts =
        showFavoriteOnly ? provider.favoritesItens : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: loadProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: loadProducts[index],
          child: const ProductItem(),
        );
      },
    );
  }
}
