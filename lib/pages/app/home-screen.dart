import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/const.dart';
import 'package:untitled/models/shoe.dart';

import '../../models/cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.listenableCart});
  final Cart listenableCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text('Everyone flies, some fly longer than others',
                        style: TextStyle(color: Colors.grey))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hot Picks 🔥',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('See All'),
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: 300,
              height: 500,
              child: ListenableBuilder(
                  listenable: listenableCart,
                  builder: (BuildContext context, Widget? child) {
                    List<Shoe> itemList = listenableCart.getShoeList();

                    return CarouselSlider.builder(
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          ItemCard(
                        currentItem: itemList[itemIndex],
                        onAddToCart: listenableCart.addItemToCart,
                      ),
                      options: CarouselOptions(
                        height: 500,
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isSearching = true;

  void changeIsSearching() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSearching
          ? Row(
              children: [
                IconButton(
                    onPressed: changeIsSearching,
                    icon: Icon(Icons.arrow_back_ios_sharp)),
                Text(
                  'Search...',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(
                  flex: 1,
                ),
                IconButton(
                    onPressed: changeIsSearching,
                    icon: Icon(Icons.cancel_outlined))
              ],
            )
          : IconButton(onPressed: changeIsSearching, icon: Icon(Icons.search)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 5),
              blurRadius: 5.0,
              spreadRadius: 3.0)
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.currentItem,
    required this.onAddToCart,
  });
  final Shoe currentItem;
  final Function onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 365,
                image: AssetImage(currentItem.imagePath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
              child: Text(
                currentItem.description,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 3.5,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentItem.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('\$${currentItem.price}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      onAddToCart(currentItem);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),
                          content: Text('Artículo Agregado al Carrito!')));
                    },
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                )
              ],
            ),
          ],
        ));
  }
}
