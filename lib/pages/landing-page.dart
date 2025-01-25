import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key, required this.onLogin});
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/nike.png')),
            SizedBox(
              height: 100,
            ),
            Text(
              'Just Do It',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Brand new sneakers and custom kicks made with premium quality.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: onLogin,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 125.0),
                child: Text(
                  'Shop Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}
