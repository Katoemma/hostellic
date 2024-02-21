import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String fname;
  final String lname;
  final String email;
  final String? profileImageUrl;

  const ProfileScreen({
    Key? key,
    required this.email,
    this.profileImageUrl,
    required this.fname,
    required this.lname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60, 
              backgroundImage: profileImageUrl == null ? null : NetworkImage(profileImageUrl!),
            ),
            const SizedBox(height: 20),
            Text(
              '$fname $lname',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.school),
              title: Text('University:'),
              subtitle: Text('Your University Name'),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Department:'),
              subtitle: Text('Your Department Name'),
            ),
            const ListTile(
              leading: Icon(Icons.group),
              title: Text('Batch:'),
              subtitle: Text('Your Batch Year'),
            ),
            // Add more ListTile widgets for additional information
          ],
        ),
      ),
    );
  }
}
