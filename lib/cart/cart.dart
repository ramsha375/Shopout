import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final String img;
  final int price;
  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.img,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String id, String name, String img, int price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          quantity: existingCartItem.quantity + 1,
          img: existingCartItem.img,
          price: price * (existingCartItem.quantity + 1),
        ),
      );
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: id, name: name, quantity: 1, img: img, price: price));
    }
    notifyListeners();
  }

  void removeSingleItem(String id, int price) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 0) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
                id: id,
                img: existingCartItem.img,
                name: existingCartItem.name,
                quantity: existingCartItem.quantity - 1,
                price: price * (existingCartItem.quantity - 1),
              ));
    }
    if (_items[id].quantity == 0) {
      _items.remove(id);
    }
    notifyListeners();
  }

  void removeItem(String id, int price) {
    _items.remove(id);
    notifyListeners();
  }
}
