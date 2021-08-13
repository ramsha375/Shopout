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
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        leading: Image.asset(
          img,
          height: 144.0,
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text(
          'Price: $price',
          style: Theme.of(context).textTheme.headline3,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            cart.addItem(pdt.id, pdt.name, pdt.img, pdt.price);
          },
        ),
      ),
    );
  }
}
