import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(
              'assets/images/WhatsApp_Image_2024-11-07_at_21.31.18_ab30500a-removebg-preview 1.png'),
        ),
      ),
    );
  }
}
