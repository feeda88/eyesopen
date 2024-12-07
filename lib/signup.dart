import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Import the login screen
import 'dashboard.dart'; // Import the dashboard screen

void main() {
  runApp(const SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: GoogleFonts.roboto(fontSize: 24, color: Colors.white)),
        backgroundColor: const Color(0xFF6E4B3A), // Brown color for AppBar
        centerTitle: true,
      ),
      body: const SignUpPage(), // Use SignUpPage here
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signUp() {
    // Add your sign-up logic here
    // After successful sign-up, navigate to the dashboard with a smoother transition
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Dashboard(),
        transitionDuration: const Duration(milliseconds: 600), // Duration of the scroll transition
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start the transition from the right
          const end = Offset.zero; // End at the default position
          const curve = Curves.easeInOut; // Apply an easing curve for a smoother, more realistic transition

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.jpg'), // Add your image asset here
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email input
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF6E4B3A)), // Brown label
                filled: true,
                fillColor: const Color(0xFFF5F1E1), // Off-white background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD8C9B7)), // Beige border
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Password input
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF6E4B3A)), // Brown label
                filled: true,
                fillColor: const Color(0xFFF5F1E1), // Off-white background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD8C9B7)), // Beige border
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Confirm Password input
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: GoogleFonts.roboto(fontSize: 16, color: const Color(0xFF6E4B3A)), // Brown label
                filled: true,
                fillColor: const Color(0xFFF5F1E1), // Off-white background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD8C9B7)), // Beige border
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign Up Button
            ElevatedButton(
              onPressed: _signUp, // Navigate to Dashboard after sign-up
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6E4B3A), // Brown button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              child: Text(
                'Sign Up',
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // Login link
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
                );
              },
              child: Text(
                'Already have an account? Log In',
                style: TextStyle(color: const Color(0xFF6E4B3A)), // Brown text color for the link
              ),
            ),
          ],
        ),
      ),
    );
  }
}
