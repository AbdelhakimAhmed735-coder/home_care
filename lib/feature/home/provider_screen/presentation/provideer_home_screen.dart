import 'package:flutter/material.dart';
import 'package:home_care/core/widgets/custom_bottom_nav.dart';
import 'package:home_care/feature/home/provider_screen/presentation/profile/profile_screen.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  int currentIndex = 0;

  final screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Requests')),
    Center(child: Text('Earnings')),
    ProfileScreen(), // Assuming you have a ProfileScreen widget defined elsewhere
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
