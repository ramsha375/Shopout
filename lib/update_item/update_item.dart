import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';

class UpdateItem extends StatelessWidget {
  final String name;
  final int quantity;
  UpdateItem(this.name, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Text(quantity.toString());
  }
}
