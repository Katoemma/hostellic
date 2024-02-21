import 'package:flutter/material.dart';
import 'package:hostelease/main.dart';
import 'package:hostelease/screens/homeScreen.dart';
import 'package:hostelease/utilities/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var fnamecontroller = TextEditingController();
  var lnamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var cpasscontroller = TextEditingController();

  //function to show snackbar with message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // function to sign up user to supabase
  void signUpUser(BuildContext context) async {
    String fname = fnamecontroller.text.trim();
    String lname = lnamecontroller.text.trim();
    String email = emailcontroller.text.trim().toLowerCase();
    String password = passcontroller.text.trim();
    String cpassword = cpasscontroller.text.trim();
    if (fname.isEmpty ||
        lname.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        cpassword.isEmpty) {
      showSnackBar('Please fill all fields');
    } else if (!email.contains('@')) {
      showSnackBar('Please enter a valid email');
    } else if (password.length < 6) {
      showSnackBar('Password must be at least 6 characters');
    } else if (password != cpassword) {
      showSnackBar('Passwords do not match');
    } else {
      // Sign up user to supabase
      try {
        // Create a user in supabase using the provided email and password.
        var response =
            await supabase.auth.signUp(password: password, email: email);
        // Handle the response from the sign up request.
        if (response.user == null) {
          showSnackBar('User not successfully created');
        } else if (response.user != null) {
          showSnackBar('Account created successfully!');
          final Session? session = await response.session;
          final User? user = await response.user;

          var userCredentials = await supabase.from('users').insert({
            'fname':fname,
            'lname': lname,
            'email': email,
            'userType':'student',
          }).select();
          // Navigate to home screen 
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          // If the response is neither an error nor data, show an error message.
          showSnackBar('An unexpected error occurred');
        }
      } catch (e) {
        showSnackBar('An unexpected error occurred');
        print('error: is $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(
                    hintText: 'First name',
                    hintStyle: const TextStyle(
                        color: Color(0xFF13ecd1), fontWeight: FontWeight.w300),
                  ),
                  controller: fnamecontroller,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Last name',
                    hintStyle: const TextStyle(
                        color: Color(0xFF13ecd1), fontWeight: FontWeight.w300),
                  ),
                  controller: lnamecontroller,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Email address',
                    hintStyle: const TextStyle(
                        color: Color(0xFF13ecd1), fontWeight: FontWeight.w300),
                  ),
                  controller: emailcontroller,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Password',
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Color(0xFF13ecd1),
                    ),
                    hintStyle: const TextStyle(
                        color: Color(0xFF13ecd1), fontWeight: FontWeight.w300),
                  ),
                  controller: passcontroller,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Confirm password',
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Color(0xFF13ecd1),
                    ),
                    hintStyle: const TextStyle(
                        color: Color(0xFF13ecd1), fontWeight: FontWeight.w300),
                  ),
                  controller: cpasscontroller,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      signUpUser(context);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13ecd7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Create account',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
