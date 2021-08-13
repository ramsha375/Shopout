import 'package:flutter/material.dart';
import './homepage/homepage.dart';
import 'package:provider/provider.dart';
import './products/products.dart';
import './cart/cart.dart';
import './cart_screen/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Shopping App ',
        theme: ThemeData(
          primaryColor: Colors.deepPurple[400],
          accentColor: Colors.white,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merriweather',
                color: Colors.deepPurple),
            headline2: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                color: Colors.deepPurple,
                fontFamily: 'Merriweather'),
            headline3: TextStyle(
                fontSize: 14.0, color: Colors.grey, fontFamily: 'Merriweather'),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Merriweather'),
          ),
        ),
        home: HomePage(),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
