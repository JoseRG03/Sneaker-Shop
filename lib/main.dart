import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/router.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Cart shopCart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneaker Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: PageWrapper(cart: shopCart),
    );
  }
}