import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';  // Import the login.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primarySwatch: Colors.brown,  // Brown for the primary theme
      ),
      home: const LoginScreen(), // Show LoginScreen as the home screen
    );
  }
}
