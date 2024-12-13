import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart'; // Import the signup screen
import 'dashboard.dart'; // Import the dashboard screen

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: GoogleFonts.roboto(fontSize: 24, color: Colors.white)),
        backgroundColor: const Color(0xFF6E4B3A), // Brown color for AppBar
        centerTitle: true,
      ),
      body: const LoginPage(), // Use LoginPage here
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Add your login logic here
    // After successful login, navigate to the dashboard with a smoother transition
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
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              onPressed: _login, // Navigate to Dashboard after login
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6E4B3A), // Brown button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // Sign-up link
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()), // Navigate to SignUpScreen
                );
              },
              child: Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(color: const Color(0xFF6E4B3A)), // Brown text color for the link
              ),
            ),
          ],
        ),
      ),
    );
  }
}
