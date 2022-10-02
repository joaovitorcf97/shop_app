import 'package:app_provider/models/order_list.dart';
import 'package:app_provider/models/product_list.dart';
import 'package:app_provider/pages/cart_page.dart';
import 'package:app_provider/pages/order_page.dart';
import 'package:app_provider/pages/product_detail_page.dart';
import 'package:app_provider/pages/products_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.home: (context) => const ProductOverviewPage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrderPage(),
        },
      ),
    );
  }
}
