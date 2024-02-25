import 'package:flutter/material.dart';
import 'package:hostelease/main.dart';
import 'package:hostelease/screens/hostelListingScreen.dart';
import 'package:hostelease/screens/loginScreen.dart';
import 'package:hostelease/screens/profileScreen.dart';
import 'package:hostelease/screens/settings.dart';
import 'package:hostelease/utilities/hostels.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, this.fname, this.lname, this.email})
      : super(key: key);

  final String? fname;
  final String? lname;
  final String? email;

  @override
  Widget build(BuildContext context) {
    // Replace these with actual user details
    String userName = lname != null ? '$fname $lname' : fname ?? '';
    String userEmail = '$email';

    late String profilePicture = supabase.storage
        .from('avatars')
        .getPublicUrl('kijani.jpg'); 
        
    final List hostelList = staticHostelList;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              userEmail,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundImage:
                  profilePicture == null ? null : NetworkImage(profilePicture),
            ),
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.home),
                Text('Home'),
              ],
            ),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.event),
                Text('Bookings'),
              ],
            ),
            onTap: () {
              // Navigate to bookings screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HostelListPage(hostelList),
                ),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.person),
                Text('Profile'),
              ],
            ),
            onTap: () {
              // Navigate to profile screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    fname: '$fname',
                    lname: '$lname',
                    email: '$email',
                    profileImageUrl: profilePicture,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings),
                Text('Settings'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.info),
                Text('About'),
              ],
            ),
            onTap: () {
              // Navigate to about screen
            },
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red[200],
                ),
                Text('Logout', style: TextStyle(color: Colors.red[200])),
              ],
            ),
            onTap: () async {
              await supabase.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
