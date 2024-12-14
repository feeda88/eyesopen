import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for state persistence

import 'flying_widget.dart'; // Make sure to import your FlyingWidget file

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isFanOn = false;
  bool isLightOn = false;
  bool isLoggedIn = false;

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
    _saveDeviceState();
    super.dispose();
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
                image: AssetImage('assets/background1.png'),
                fit: BoxFit.cover,
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
              mainAxisAlignment: MainAxisAlignment.center, // Center the items vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
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
                const SizedBox(height: 20), // Increased space between sections

                // Container to hold both the Fan and Light controls in the same box
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
                  child: Column( // Column to hold both the fan and light controls vertically
                    children: [
                      // Fan Control Box
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\ud83c\udf2c\ufe0f Fan", // Added fan emoji
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
                      ),
                      const SizedBox(height: 15), // Add spacing between the fan and light controls

                      // Light Control Box
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\ud83d\udca1 Light", // Added light bulb emoji
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const FlyingWidget(),
          );
        },
        backgroundColor: const Color(0xFF6E4B3A), // Brown color
        child: const Icon(Icons.widgets),
      ),
    );
  }
}
