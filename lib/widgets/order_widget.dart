import 'package:app_provider/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
          subtitle:
              Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
          children: widget.order.products.map((product) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(product.imageUrl),
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                '${product.quantity}x R\$ ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
