import 'package:flutter/material.dart';
import 'package:untitled/models/shoe.dart';

import '../../const.dart';
import '../../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.listenableCart});
  final Cart listenableCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'My Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            ListenableBuilder(
                listenable: listenableCart,
                builder: (BuildContext context, Widget? child) {
                  List<Shoe> currentCart = listenableCart.getUserCart();

                  return Column(
                    children: currentCart
                        .map((item) => CartItemCard(
                              currentItem: item,
                              onDeleteFromCart:
                                  listenableCart.removeItemFromCart,
                            ))
                        .toList(),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.currentItem,
    required this.onDeleteFromCart,
  });
  final Shoe currentItem;
  final Function onDeleteFromCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
            child: Image(
              image: AssetImage(currentItem.imagePath),
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentItem.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('\$${currentItem.price}'),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                onDeleteFromCart(currentItem);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),
                    content: Text('Artículo Eliminado Exitosamente!')));
              },
              icon: Icon(Icons.delete))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
    );
  }
}
