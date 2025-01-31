import 'package:flutter/material.dart';

class NewPlaylistPage extends StatelessWidget {
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
            // Centered "New Playlist" text
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Space between title and text field

                  // Text field for playlist title
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% of screen width
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Give your playlist a title',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                      height: 40), // Space between text field and "Invite" text

                  // "Invite" text
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Invite',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10), // Space between "Invite" text and search bar

                  // Search bar for inviting friends
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% of screen width
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Invite your friends',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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

            // Cancel and Save buttons at the bottom
            Positioned(
              bottom: 40.0, // Distance from the bottom
              left: 20.0, // Distance from the left
              right: 20.0, // Distance from the right
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800], // Grey color
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Save button
                  ElevatedButton(
                    onPressed: () {
                      // Save playlist logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Deep sea blue color
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
