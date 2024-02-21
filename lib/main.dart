import 'package:flutter/material.dart';
import 'package:hostelease/mainPage.dart';
import 'package:hostelease/screens/homeScreen.dart';
import 'package:hostelease/screens/loginScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://zotrpjxgecagpwtvugjz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvdHJwanhnZWNhZ3B3dHZ1Z2p6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4Mjg2NDAsImV4cCI6MjAyMzQwNDY0MH0.tf89oxcyQ-ekqg4_gKMlKYX0MLZdJc9-wFtQy1WwLWU',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),

  );

  runApp(const MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      home: const MainPage() ,
    );
  }
}
