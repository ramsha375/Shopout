import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopout/cart/cart.dart';
import '../products/products.dart';
import '../cart/cart.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String img;
  final int price;
  ProductItem({this.name, this.img, this.price});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridTile(
        child: Image.asset(img),
        footer: GridTileBar(
          title: Center(
              child: Column(
            children: [Text(name), Text('Price: $price')],
          )),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(pdt.id, pdt.name, pdt.img, pdt.price);
            },
          ),
          backgroundColor: Colors.deepPurple[400],
        ),
      ),
    );
  }
}
