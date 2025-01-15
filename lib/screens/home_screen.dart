import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String loginMethod;

  const HomeScreen({Key? key, required this.loginMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - $loginMethod'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!\nLogged in with $loginMethod',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
