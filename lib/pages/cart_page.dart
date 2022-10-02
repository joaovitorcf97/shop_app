import 'package:app_provider/models/cart.dart';
import 'package:app_provider/models/order_list.dart';
import 'package:app_provider/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) {
                return CartItemWidget(cartItem: items[index]);
              },
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor.withOpacity(.2),
            margin: const EdgeInsets.all(16),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  const SizedBox(width: 8),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text('R\$ ${cart.totalAmount}'),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      cart.clear();
                    },
                    child: const Text('Comprar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
