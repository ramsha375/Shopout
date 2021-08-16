import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopout/order/order.dart';
import '../cart/cart.dart';
import '../checkout_item/checkoutItem.dart';
import '../checkout_data/checkout_data.dart';
import '../order/order.dart';
import '../bottomappbar/bottom_appbar.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    int subtotal = 0;
    for (int i = 0; i < cart.items.length; i++) {
      subtotal = subtotal + cart.items.values.toList()[i].price;
    }
    int total = subtotal + 200;

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
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Text(
                'Checkout',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: AppbarBottom()),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            children: <Widget>[
              Wrap(children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.items.length,
                      itemBuilder: (ctx, i) => CheckoutPdt(
                          cart.items.values.toList()[i].name,
                          cart.items.values.toList()[i].quantity.toString(),
                          cart.items.values.toList()[i].img,
                          cart.items.values.toList()[i].price)),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              CheckoutData('Subtotal: ', '$subtotal'),
              CheckoutData('Shipping: ', '200'),
              CheckoutData('Total: ', '$total'),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Order()));
                  },
                  child: Text('Place Order',
                      style: Theme.of(context).textTheme.headline5),
                  color: Theme.of(context).primaryColor,
                  elevation: 5,
                ),
              ),
            ],
          ),
        ));
  }
}
