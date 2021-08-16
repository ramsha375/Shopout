import 'package:flutter/material.dart';
import '../bottomappbar/bottom_appbar.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.check_circle),
                onPressed: () {},
              ),
              Text(
                'Order Confirmed',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: AppbarBottom()),
        body: Center(
          child: Text(
            'Your order has been placed!',
            style: Theme.of(context).textTheme.headline3,
          ),
        ));
  }
}
