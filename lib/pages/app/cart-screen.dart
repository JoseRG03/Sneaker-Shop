import 'package:flutter/material.dart';

import '../../const.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      child: Center(
        child: Text('Cart'),
      ),
    );
  }
}
