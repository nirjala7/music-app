import 'package:flutter/material.dart';
import 'InPlaylist.dart';

class InFolderPage extends StatelessWidget {
  final String title;

  InFolderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sort section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sort By",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      "Recently Played",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.swap_vert, color: Colors.white, size: 18),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // "Add New Playlist" option
            ListTile(
              leading: Icon(Icons.add, color: Colors.white, size: 40),
              title: Text(
                "Add New Playlist",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Implement adding playlist functionality
              },
            ),

            // Playlist items (Hardcoded)
            Expanded(
              child: ListView(
                children: [
                  _buildClickablePlaylistItem(context, "lib/Images/pic3.jpg",
                      "Chill Vibes"), // Clickable
                  _buildPlaylistItem("lib/Images/pic4.jpg", "Morning Energy"),
                  _buildPlaylistItem("lib/Images/pic5.jpg", "Lo-Fi Beats"),
                  _buildPlaylistItem("lib/Images/pic6.jpg", "Jazz & Blues"),
                  _buildPlaylistItem("lib/Images/pic7.jpg", "Workout Hype"),
                  _buildPlaylistItem("lib/Images/pic8.jpg", "Relax & Unwind"),
                  _buildPlaylistItem(
                      "lib/Images/pic9.jpg", "Classic Throwbacks"),
                  _buildPlaylistItem("lib/Images/pic10.jpg", "Indie Love"),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: "Library"),
        ],
      ),
    );
  }

  // Clickable Playlist Item (Navigates to InPlaylist)
  Widget _buildClickablePlaylistItem(
      BuildContext context, String imagePath, String playlistName) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InPlaylistPage(
              playlistTitle: playlistName,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: _buildPlaylistItem(imagePath, playlistName),
    );
  }

  // Non-Clickable Playlist Item
  Widget _buildPlaylistItem(String imagePath, String playlistName) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(
        playlistName,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("11 songs", style: TextStyle(color: Colors.grey)),
    );
  }
}
