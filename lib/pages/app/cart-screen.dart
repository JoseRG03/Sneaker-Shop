import 'package:flutter/material.dart';

import '../../const.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('My Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            CartItemCard()
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
            child: Image(image: AssetImage('assets/images/sneakers-1.png'),
            width: 75, height: 75, fit: BoxFit.cover,),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Zoom FREAK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text('\$236'),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
    );
  }
}
