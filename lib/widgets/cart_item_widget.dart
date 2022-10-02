import 'package:app_provider/models/cart.dart';
import 'package:app_provider/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(
          cartItem.productId,
        );
      },
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(cartItem.name),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(cartItem.imageUrl),
        ),
        subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
        trailing: Text('${cartItem.quantity}x'),
      ),
    );
  }
}
