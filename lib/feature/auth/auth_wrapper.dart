import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_care/feature/auth/login_ui/login.dart';
import 'package:home_care/feature/home/coustmer_home_screen/presentation/custmer_home_screen.dart';
import 'package:home_care/feature/home/provider_screen/presentation/provideer_home_screen.dart';
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

        if (accountType == 'Custumer') {
          return const CustmerHomeScreen();
        }

        return const ProviderHomeScreen();
      },
    );
  }
}
