import 'package:flutter/material.dart';
import 'package:untitled/pages/app/app-wrapper.dart';
import 'package:untitled/pages/landing-page.dart';

import 'models/cart.dart';

class PageWrapper extends StatefulWidget {
  const PageWrapper({super.key, required this.cart});

  final Cart cart;

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  bool isLoggedIn = false;

  void handleLogin() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? AppWrapper() : LandingPage(onLogin: handleLogin,);
  }
}
