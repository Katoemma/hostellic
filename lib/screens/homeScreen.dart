import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:gotrue/src/types/session.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:hostelease/components/drawerWidget.dart';
import 'package:hostelease/main.dart';
import 'package:hostelease/navScreens/dashboard.dart';
import 'package:hostelease/screens/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  String? fname;
  String? lname;

  final User? user = supabase.auth.currentUser;

  @override
  void initState() {
    super.initState();
    // Call the asynchronous method in initState
    usersCredentials();
  }

  // Define an asynchronous method to fetch user credentials
  void usersCredentials() async {
    final userCredentials = await supabase
        .from('users')
        .select('fname,lname')
        .eq('email', '${user?.email}');

    if (userCredentials.isEmpty) {
      print('Failed to retrieve user credentials');
    } else {
      // Update state with the fetched first name
      setState(() {
        fname = userCredentials[0]['fname'];
        lname = userCredentials[0]['lname'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: MyDrawer(
          fname: fname,
          lname: lname ?? 'loading',
          email: '${user?.email}',
        ),
      ),
      body: SafeArea(
        child: Dashboard(
          fname: fname,
        ),
      ),
    );
  }
}
