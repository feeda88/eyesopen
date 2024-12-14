import 'package:flutter/material.dart';

class FlyingWidget extends StatelessWidget {
  const FlyingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded edges
      ),
      backgroundColor: const Color(0xFFF5F5DC), // Beige background
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Add padding around the content
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content dynamically
          crossAxisAlignment: CrossAxisAlignment.center, // Center-align content
          children: [
            const Text(
              'Current Consumption:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text color
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the box
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Subtle shadow
                  ),
                ],
              ),
              child: const Text(
                '50 kWh', // Placeholder value
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Bold black text
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Facture:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text color
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the box
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Subtle shadow
                  ),
                ],
              ),
              child: const Text(
                '120 TND', // Placeholder value
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Bold black text
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
