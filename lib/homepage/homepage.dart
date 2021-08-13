import 'package:flutter/material.dart';
import 'package:shopout/allproducts/allproducts.dart';
import '../cart_screen/cart_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.shop),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
              Text(
                'Shopout',
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).accentColor),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart, size: 30),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            alignment: Alignment.topLeft,
            child: Text(
              'Books',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(physics: ScrollPhysics(), children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 600,
                child: AllProducts(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
