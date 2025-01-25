import 'package:flutter/material.dart';
import 'package:untitled/components/custom-nav-bar.dart';
import 'package:untitled/const.dart';
import 'package:untitled/pages/app/cart-screen.dart';
import 'package:untitled/pages/app/home-screen.dart';

import '../../models/nav-bar-option.dart';

class AppWrapper extends StatefulWidget {
  AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int selectedOption = 1;
  List<NavBarOption> options = [
    NavBarOption(
      label: 'Home',
      icon: Icons.home,
      route: Center(
        child: Text('Home'),
      ),
    ),
    NavBarOption(
      label: 'Cart',
      icon: Icons.shopping_cart,
      route: Center(
        child: Text('Cart'),
      ),
    ),
  ];
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
  ];

  void handleNavBarChange(int newOption) {
    setState(() {
      selectedOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Now works!
            },
          ),
        ),
        backgroundColor: lightGrey,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/nike_inverted.png',),),
              SizedBox(height: 50,),
              Row(
                children: [
                  Icon(Icons.home, color: Colors.white, size: 30,),
                  SizedBox(width: 30,),
                  Text('Home', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.info, color: Colors.white, size: 30,),
                  SizedBox(width: 30,),
                  Text('About', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
              Spacer(flex: 1,),
              Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.white, size: 30,),
                  SizedBox(width: 30,),
                  Text('Log Out', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: pages[selectedOption],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedOption: selectedOption,
        onSelectionChange: handleNavBarChange,
        options: options,
      ),
    );
  }
}
