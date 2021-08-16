import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String img;
  final int price;
  final int quantity;
  Product({
    @required this.id,
    @required this.name,
    @required this.img,
    @required this.price,
    @required this.quantity,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        name: 'Brief Answers to the Big questions',
        img: 'assets/book1.png',
        price: 500,
        quantity: 0),
    Product(
        id: '2',
        name: 'Forty Rules of Love',
        img: 'assets/book2.jpeg',
        price: 500,
        quantity: 0),
    Product(
        id: '3',
        name: 'Rich Dad Poor Dad',
        img: 'assets/book3.jpg',
        price: 500,
        quantity: 0),
    Product(
        id: '4',
        name: 'Losing Hope',
        img: 'assets/book4.jpg',
        price: 500,
        quantity: 0),
    Product(
        id: '5',
        name: 'The 7 Habits of Highly Effective People',
        img: 'assets/book5.jpg',
        price: 500,
        quantity: 0),
    Product(
        id: '6',
        name: 'Reclaim Your Heart',
        img: 'assets/book6.jpg',
        price: 500,
        quantity: 0),
    Product(
        id: '7',
        name: 'It Ends With Us',
        img: 'assets/book7.jpg',
        price: 500,
        quantity: 0),
    Product(
        id: '8',
        name: 'Hopeless',
        img: 'assets/book8.jpg',
        price: 500,
        quantity: 0),
  ];
  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
