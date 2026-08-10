import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care/feature/auth/login_ui/login.dart';
import 'package:home_care/feature/home_ui/ui/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        debugPrint('Connection: ${snapshot.connectionState}');
        debugPrint('User: ${snapshot.data}');
        debugPrint('Current User: ${FirebaseAuth.instance.currentUser}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const Home();
        }

        return const Login();
      },
    );
  }
}
