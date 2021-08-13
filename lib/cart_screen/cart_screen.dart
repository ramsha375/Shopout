import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';
import '../cart_item/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            Text(
              'Cart',
              style:
                  TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].quantity.toString(),
                    cart.items.values.toList()[i].img,
                    cart.items.values.toList()[i].price)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {},
              child: const Text('Check out', style: TextStyle(fontSize: 20)),
              color: Colors.deepPurple[400],
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
