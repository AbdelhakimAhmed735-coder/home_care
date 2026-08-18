import 'package:flutter/material.dart';

class CustmerHomeScreen extends StatelessWidget {
  const CustmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Home')),
      body: const Center(child: Text('Customer Home Screen')),
    );
  }
}
