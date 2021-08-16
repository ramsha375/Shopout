import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopout/cart/cart.dart';
import '../products/products.dart';
import '../cart/cart.dart';
import '../update_item/update_item.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String img;
  final String id;
  final int price;
  final int quantity;

  ProductItem({this.name, this.img, this.price, this.quantity, this.id});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    final loadedPdt = Provider.of<Cart>(context).findById(id);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          leading: Image.asset(
            img,
            height: 144.0,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: Text(
            'Rs.$price',
            style: Theme.of(context).textTheme.headline4,
          ),
          trailing: Wrap(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Center(
                  child: (loadedPdt != null)
                      ? UpdateItem(loadedPdt.name, loadedPdt.quantity)
                      : Text('0'),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  cart.addItem(pdt.id, pdt.name, pdt.img, pdt.price);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
