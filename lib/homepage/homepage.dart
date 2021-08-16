import 'package:flutter/material.dart';
import 'package:shopout/allproducts/allproducts.dart';
import 'package:shopout/bottomappbar/bottom_appbar.dart';
import '../cart_screen/cart_screen.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    int totalQuantity = 0;
    for (int i = 0; i < cart.items.length; i++)
      totalQuantity = totalQuantity + cart.items.values.toList()[i].quantity;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.shop),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Shopout',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Center(
                  child: Text(
                    totalQuantity.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
          ]),
      bottomNavigationBar: BottomAppBar(child: AppbarBottom()),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 24),
            alignment: Alignment.topLeft,
            child: Text(
              'Books',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: AllProducts(),
          ),
        ],
      ),
    );
  }
}
