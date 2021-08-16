import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';
import '../cart_item/cart_item.dart';
import '../checkout/CheckoutScreen.dart';
import '../bottomappbar/bottom_appbar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    int total = 0;
    for (int i = 0; i < cart.items.length; i++)
      total = total + cart.items.values.toList()[i].price;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor, //change your color here
          ),
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
              Text(
                'Cart',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: AppbarBottom()),
        body: (total > 0)
            ? Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cart.items.length,
                          itemBuilder: (ctx, i) => CartPdt(
                              cart.items.values.toList()[i].id,
                              cart.items.values.toList()[i].name,
                              cart.items.values.toList()[i].quantity.toString(),
                              cart.items.values.toList()[i].img,
                              cart.items.values.toList()[i].price))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScreen()));
                      },
                      child: Text('Check out',
                          style: Theme.of(context).textTheme.headline5),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'No items added!',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ));
  }
}
