import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';

class CheckoutPdt extends StatelessWidget {
  final String name;
  final String quantity;
  final String img;
  final int price;
  CheckoutPdt(this.name, this.quantity, this.img, this.price);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    int total = 0;
    for (int i = 0; i < cart.items.length; i++)
      total = total + cart.items.values.toList()[i].price;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('$name'),
          ),
          Container(child: Text('x$quantity Rs.$price')),
        ],
      ),
    );
  }
}
