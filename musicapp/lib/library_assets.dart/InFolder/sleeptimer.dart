import 'package:flutter/material.dart';

class SleepTimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black, // Bottom color (darkest)
              Colors.black.withOpacity(0.9), // Slightly lighter than black
              Colors.grey[900]!.withOpacity(0.8), // Dark gray
            ],
          ),
        ),
        child: Stack(
          children: [
            // Centered "Stop audio in" text
            Center(
              child: Text(
                'Stop audio in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Options list positioned below the centered text
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 +
                  30, // Start below the center
              left: 40.0, // Additional left padding
              right: 0, // Stretch to the right edge
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  _buildOptionText('End of Track'),
                  _buildOptionText('5 min'),
                  _buildOptionText('10 min'),
                  _buildOptionText('15 min'),
                  _buildOptionText('30 min'),
                  _buildOptionText('1 hour'),
                ],
              ),
            ),

            // Back button at the top-left corner
            Positioned(
              top: 40.0, // Distance from the top
              left: 20.0, // Distance from the left
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white, // White color for the icon
                  size: 30, // Size of the icon
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each option text
  Widget _buildOptionText(String label) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 10.0), // Vertical padding only
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22, // Increased size for better readability
        ),
      ),
    );
  }
}
