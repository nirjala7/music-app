import 'package:flutter/material.dart';

class AddPlaylistPage extends StatefulWidget {
  @override
  _AddPlaylistPageState createState() => _AddPlaylistPageState();
}

class _AddPlaylistPageState extends State<AddPlaylistPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> playlists = [
    {'title': 'Chill Vibes', 'subtitle': '10 Songs', 'image': 'pic1'},
    {'title': 'Morning Motivation', 'subtitle': '15 Songs', 'image': 'pic2'},
    {'title': 'Workout Beats', 'subtitle': '12 Songs', 'image': 'pic3'},
    {'title': 'Indie Rock', 'subtitle': '8 Songs', 'image': 'pic4'},
    {'title': 'Pop Hits', 'subtitle': '20 Songs', 'image': 'pic5'},
    {'title': 'Jazz Classics', 'subtitle': '16 Songs', 'image': 'pic6'},
    {'title': 'Top 40', 'subtitle': '40 Songs', 'image': 'pic7'},
    {'title': 'Relaxing Piano', 'subtitle': '7 Songs', 'image': 'pic8'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add to Playlist',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Playlist Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for creating a new playlist
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Blue color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'New Playlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Search Bar with dark text and light placeholder
            TextField(
              controller: _searchController,
              style: TextStyle(
                  color: Colors.black), // Dark text color for user input
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color for the text field
                hintText: 'Find playlist', // Placeholder text
                hintStyle: TextStyle(
                    color: Colors.grey), // Light color for placeholder
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey, // Light color for search icon
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide.none, // Remove the border for a smooth look
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
            SizedBox(height: 20),

            // Title for Random Playlists
            Text(
              'Random Playlists',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Display Random Playlists
            Expanded(
              child: ListView.builder(
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  return PlaylistCard(
                    title: playlists[index]['title']!,
                    subtitle: playlists[index]['subtitle']!,
                    image: playlists[index]['image']!,
                    onTap: () {
                      // Add functionality when tapping on the playlist
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  PlaylistCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.grey[850],
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'lib/Images/$image.jpg', // Assuming the images are in the assets folder
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
