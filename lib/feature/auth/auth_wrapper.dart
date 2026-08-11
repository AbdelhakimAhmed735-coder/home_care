import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care/feature/auth/login_ui/login.dart';
import 'package:home_care/feature/home_ui/ui/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    debugPrint('========================');
    debugPrint('CURRENT USER: $user');
    debugPrint('EMAIL: ${user?.email}');
    debugPrint('UID: ${user?.uid}');
    debugPrint('========================');

    if (user != null) {
      return const Home();
    }

    return const Login();
  }
}
