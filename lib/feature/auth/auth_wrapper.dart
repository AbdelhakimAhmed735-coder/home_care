import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care/feature/auth/login_ui/login.dart';
import 'package:home_care/feature/coustmer_home_screen/view/custmer_home_screen.dart';
import 'package:home_care/feature/provider_home_screen/presentation/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Login();
    }

    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final prefs = snapshot.data!;
        final accountType = prefs.getString('accountType');

        if (accountType == 'serviceProvider') {
          return const ProviderHomeScreen();
        }

        return const CustmerHomeScreen();
      },
    );
  }
}
