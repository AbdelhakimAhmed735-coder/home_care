import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Image
            const CircleAvatar(radius: 55, child: Icon(Icons.person, size: 55)),

            const SizedBox(height: 15),

            // Name
            const Text(
              'Provider Name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // Account Type
            const Text(
              'Service Provider',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),

            const SizedBox(height: 30),

            // Phone
            ListTile(
              leading: const Icon(Icons.phone_outlined),
              title: const Text('Phone Number'),
              subtitle: const Text('+20 10xxxxxxxx'),
            ),

            // Service
            ListTile(
              leading: const Icon(Icons.home_repair_service_outlined),
              title: const Text('Service'),
              subtitle: const Text('Plumber'),
            ),

            // Experience
            ListTile(
              leading: const Icon(Icons.work_outline),
              title: const Text('Experience'),
              subtitle: const Text('5 Years'),
            ),

            // Location
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Location'),
              subtitle: const Text('Cairo, Egypt'),
            ),

            const SizedBox(height: 20),

            // Edit Profile
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Edit Profile
                },
                child: const Text('Edit Profile'),
              ),
            ),

            const SizedBox(height: 10),

            // Settings
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Settings
              },
            ),

            // Logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
