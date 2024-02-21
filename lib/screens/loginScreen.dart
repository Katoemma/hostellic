import 'package:flutter/material.dart';
import 'package:hostelease/main.dart';
import 'package:hostelease/screens/homeScreen.dart';
import 'package:hostelease/screens/signUpScreen.dart';
import 'package:hostelease/utilities/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    //validate data data from controllers
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      //show snack bar with error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fill all fields'),
        ),
      );
    } else {
      try {
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
        final Session? session = res.session;
        final User? user = res.user;

        //navigator to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Invalid login Credentials'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.help),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 100,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration,
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(hintText: 'Password'),
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      login();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13ecd7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Log in',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //navigator to sign up screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    });
                  },
                  child: const Text(
                    'New user? Sign Up',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
