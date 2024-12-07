import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for state persistence

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isFanOn = false;
  bool isLightOn = false;
  bool isLoggedIn = false; // To track if the user is logged in

  @override
  void initState() {
    super.initState();
    _loadDeviceState(); // Load saved state when the app starts
    _loadLoginState(); // Load login state to determine if the user is logged in
  }

  // Load the saved states from shared preferences
  void _loadDeviceState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFanOn = prefs.getBool('fanState') ?? false;
      isLightOn = prefs.getBool('lightState') ?? false;
    });
  }

  // Load login state (whether the user is logged in or a guest)
  void _loadLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  // Save the device state to shared preferences
  void _saveDeviceState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('fanState', isFanOn);
    prefs.setBool('lightState', isLightOn);
  }

  @override
  void dispose() {
    _saveDeviceState(); // Save state when the widget is disposed
    super.dispose();
  }

  // Function to navigate to either profile or sign-up page
  void _navigateToProfileOrSignup() {
    if (isLoggedIn) {
      // Navigate to user profile
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserProfilePage()),
      );
    } else {
      // Navigate to sign-up page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E1), // Off-white background
        title: Text(
          "Smart Home Dashboard",
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6E4B3A), // Brown text
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image with reduced opacity
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.png'),  // Updated to background1.png
                fit: BoxFit.cover,  // Ensures the image covers the entire background
              ),
            ),
          ),
          // Overlay with reduced opacity
          Container(
            color: Colors.black.withOpacity(0.3), // Black overlay with opacity
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Control Your Devices Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F1E1).withOpacity(0.8), // Reduced opacity for background
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD8C9B7), // Beige shadow color
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "Control Your Devices",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6E4B3A),
                    ),
                  ),
                ),
                const SizedBox(height: 5), // Reduced space here

                // Fan Control Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F1E1).withOpacity(0.8), // Reduced opacity for background
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD8C9B7), // Beige shadow color
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "🌬️ Fan", // Added fan emoji
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: const Color(0xFF6E4B3A),
                            ),
                          ).animate().fade().scale(),
                        ],
                      ),
                      FlutterSwitch(
                        value: isFanOn,
                        onToggle: (value) {
                          setState(() {
                            isFanOn = value;
                          });
                        },
                        activeColor: const Color(0xFF6E4B3A), // Dark brown for active state
                        inactiveColor: const Color(0xFFD8C9B7), // Beige for inactive state
                      ),
                    ],
                  ).animate().move(delay: 200.ms, duration: 400.ms), // Animates position
                ),
                const SizedBox(height: 5), // Further reduced space here

                // Light Control Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F1E1).withOpacity(0.8), // Reduced opacity for background
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD8C9B7), // Beige shadow color
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "💡 Light", // Added light bulb emoji
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: const Color(0xFF6E4B3A),
                            ),
                          ).animate().fade().scale(),
                        ],
                      ),
                      FlutterSwitch(
                        value: isLightOn,
                        onToggle: (value) {
                          setState(() {
                            isLightOn = value;
                          });
                        },
                        activeColor: const Color(0xFF6E4B3A), // Dark brown for active state
                        inactiveColor: const Color(0xFFD8C9B7), // Beige for inactive state
                      ),
                    ],
                  ).animate().move(delay: 400.ms, duration: 400.ms), // Animates position
                ),
                const SizedBox(height: 20), // Increased space here

                // Current Consumption Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F1E1).withOpacity(0.8), // Reduced opacity for background
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD8C9B7), // Beige shadow color
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Current Consumption",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6E4B3A),
                        ),
                      ).animate()
                       .fadeIn(duration: 600.ms)
                       .then(delay: 200.ms) // baseline=800ms
                       .slide(),
                      const SizedBox(height: 10),
                      Text(
                        "Fan: ${isFanOn ? 'ON' : 'OFF'}",
                        style: TextStyle(
                            fontSize: 16, color: isFanOn ? const Color(0xFF6E4B3A) : const Color(0xFFD8C9B7)),
                      ).animate().fade().scale(),
                      Text(
                        "Light: ${isLightOn ? 'ON' : 'OFF'}",
                        style: TextStyle(
                            fontSize: 16, color: isLightOn ? const Color(0xFF6E4B3A) : const Color(0xFFD8C9B7)),
                      ).animate().fade().scale(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToProfileOrSignup,
        backgroundColor: const Color(0xFF6E4B3A), // Dark brown button color
        child: Icon(
          isLoggedIn ? Icons.person : Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: Center(child: Text("User Profile Page")),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Center(child: Text("Sign Up Page")),
    );
  }
}
