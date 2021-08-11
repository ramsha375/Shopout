import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../cart/cart.dart';
// import '../products/products.dart';

class CartPdt extends StatelessWidget {
  final String id;
  //final String productid;
  final String quantity;
  final String name;
  final String img;
  final int price;
  CartPdt(
      this.id,
      this.name,
      //this.productid,
      this.quantity,
      this.img,
      this.price);

  @override
  Widget build(BuildContext context) {
    //final pdt = Provider.of<Product>(context);
    //final cart = Provider.of<Cart>(context);
    return Card(
        child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            leading: Image.asset(img),
            // title: Column(
            //   children: [
            //     Text(name),
            //     Text('Price: $price'),
            //   ],
            // ),
            title: Column(
              children: [
                Text(name),
                Text('Price: $price'),
                Text('Quantity: $quantity'),
              ],
            ),
            //Text('Quantity: $quantity'),
            trailing: Wrap(children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  '$quantity',
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ])));
  }
}
