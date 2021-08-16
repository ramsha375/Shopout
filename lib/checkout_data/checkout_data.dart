import 'package:flutter/material.dart';

class CheckoutData extends StatelessWidget {
  final String name;
  final String value;
  CheckoutData(this.name, this.value);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('$name'),
          ),
          Container(child: Text('Rs.$value')),
        ],
      ),
    );
  }
}
