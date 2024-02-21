import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Account Settings'),
            leading: const Icon(Icons.account_circle),
            onTap: () {
              // Navigate to account settings screen
            },
          ),
          ListTile(
            title: const Text('Notification Settings'),
            leading: const Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings screen
            },
          ),
          ListTile(
            title: const Text('App Preferences'),
            leading: const Icon(Icons.settings),
            onTap: () {
              // Navigate to app preferences screen
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              // Navigate to privacy policy screen
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            leading: const Icon(Icons.rule),
            onTap: () {
              // Navigate to terms of service screen
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
        ],
      ),
    );
  }
}
