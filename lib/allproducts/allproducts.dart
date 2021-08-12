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

    return GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        children: List.generate(
            pdts.length,
            (i) => ChangeNotifierProvider.value(
                value: pdts[i],
                child: ProductItem(
                    name: pdts[i].name,
                    img: pdts[i].img,
                    price: pdts[i].price))));
  }
}
