import 'package:flutter/material.dart';

class LikedSongsPage extends StatelessWidget {
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
            // Centered message for no liked songs
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border, // Heart icon
                    color: Colors.grey[600], // Grey color for the icon
                    size: 60, // Size of the icon
                  ),
                  SizedBox(height: 20), // Space between icon and text
                  Text(
                    'No songs in your liked songs',
                    style: TextStyle(
                      color: Colors.grey[600], // Grey color for the text
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Top bar with back button and title
            Positioned(
              top: 40.0, // Distance from the top
              left: 20.0, // Distance from the left
              right: 20.0, // Distance from the right
              child: Row(
                children: [
                  // Back button
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white, // White color for the icon
                      size: 30, // Size of the icon
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                  ),
                  SizedBox(width: 10), // Space between back button and title
                  // Title
                  Text(
                    'Liked Songs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
