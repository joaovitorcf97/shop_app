import 'package:app_provider/models/order_list.dart';
import 'package:app_provider/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drower.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, index) {
          return OrderWidget(order: orders.items[index]);
        },
      ),
    );
  }
}
