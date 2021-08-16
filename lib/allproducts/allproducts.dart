import 'package:flutter/material.dart';
import 'package:shopout/product_item/product_item.dart';
import '../products/products.dart';
import 'package:provider/provider.dart';
import '../product_item/product_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts = productData.items;

    return ListView.builder(
        itemCount: pdts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: pdts[i],
              child: ProductItem(
                name: pdts[i].name,
                img: pdts[i].img,
                id: pdts[i].id,
                price: pdts[i].price,
                quantity: pdts[i].quantity,
              ),
            ));
  }
}
