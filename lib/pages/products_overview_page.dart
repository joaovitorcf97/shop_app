import 'package:app_provider/models/cart.dart';
import 'package:app_provider/routes/routes.dart';
import 'package:app_provider/widgets/app_drower.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

enum FilterOption {
  favorite,
  all,
}

class ProductOverviewPage extends StatefulWidget {
  const ProductOverviewPage({super.key});

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
        actions: [
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
            ),
            builder: (ctx, cart, child) => Badge(
              badgeColor: Theme.of(context).primaryColor,
              badgeContent: Text(cart.itemsCount.toString()),
              position: BadgePosition.topEnd(top: 5, end: 3),
              child: child,
            ),
          ),
          PopupMenuButton(
            initialValue: FilterOption.all,
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text('Todos'),
              ),
              const PopupMenuItem(
                value: FilterOption.favorite,
                child: Text('Somente Favoritos'),
              ),
            ],
            onSelected: (FilterOption seletectValue) {
              setState(() {
                if (seletectValue == FilterOption.all) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
    );
  }
}
