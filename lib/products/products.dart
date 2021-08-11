import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String img;
  final int price;
  Product({
    @required this.id,
    @required this.name,
    @required this.img,
    @required this.price,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(id: '1', name: 'Book1', img: 'assets/book1.jpg', price: 500),
    Product(id: '2', name: 'Book2', img: 'assets/book2.jpg', price: 500),
    Product(id: '3', name: 'Book3', img: 'assets/book3.png', price: 500),
    Product(id: '4', name: 'Book4', img: 'assets/book4.jpg', price: 500),
    Product(id: '5', name: 'Book5', img: 'assets/book5.jpg', price: 500),
    Product(id: '6', name: 'Book6', img: 'assets/book6.jpg', price: 500),
    Product(id: '7', name: 'Book7', img: 'assets/book7.jpg', price: 500),
    Product(id: '8', name: 'Book8', img: 'assets/book8.jpg', price: 500),
  ];
  List<Product> get items {
    return [..._items];
  }
}
