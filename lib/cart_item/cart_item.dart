import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';
import '../products/products.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String quantity;
  final String name;
  final String img;
  final int price;
  CartPdt(this.id, this.name, this.quantity, this.img, this.price);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(id);
    final cart = Provider.of<Cart>(context);
    return Card(
      child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          leading: Image.asset(img),
          title: Text(
            name,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: Text(
            'Price: $price',
            style: Theme.of(context).textTheme.headline3,
          ),
          trailing: Wrap(children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.removeSingleItem(loadedPdt.id, loadedPdt.price);
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                '$quantity',
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cart.addItem(loadedPdt.id, loadedPdt.name, loadedPdt.img,
                    loadedPdt.price);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(loadedPdt.id, loadedPdt.price);
              },
            ),
          ])),
    );
  }
}
