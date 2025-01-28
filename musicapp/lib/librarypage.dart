import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LibraryPage(),
    );
  }
}

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('lib/Images/logo.png', height: 40),
            SizedBox(width: 10),
            Text(
              'Your Library',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        actions: [
          // Removed search icon as requested
        ],
      ),
      body: ListView(
        children: [
          // Scrollable category boxes with smaller size
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryBox('Folders', Icons.folder),
                  _categoryBox('Podcasts', Icons.podcasts),
                  _categoryBox('Artists', Icons.person),
                  _categoryBox('Albums', Icons.album),
                  _categoryBox('Podcasts', Icons.podcasts),
                ],
              ),
            ),
          ),
          // Add New Playlist and Liked Songs buttons (larger size)
          _actionButton(Icons.add, Colors.cyan, 'Add New Playlist'),
          _actionButton(Icons.favorite, Colors.cyan, 'Your Liked Songs'),

          // Recently Played section with aqua color
          _recentlyPlayed(),

          // Artists Section
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _artistList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create category boxes (hollow with white imported icons)
  Widget _categoryBox(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Function to create action buttons with icons (larger size)
  Widget _actionButton(IconData icon, Color iconColor, String label) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding:
                  EdgeInsets.all(12.0), // Increased padding for larger size
              child: Icon(icon,
                  color: Colors.white, size: 35), // Increased icon size
            ),
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Recently Played Section with aqua color
  Widget _recentlyPlayed() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(Icons.swap_horiz, color: Colors.cyan),
          SizedBox(width: 8),
          Text(
            'Recently Played',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
        ],
      ),
    );
  }

  // Artist List with images lined up vertically and names to the right
  Widget _artistList() {
    List<String> artists = [
      'Elder Pulse',
      'Mosaic Dream',
      'Zephyr Lark',
      'Velvet Echo',
      'Nova Coda',
      'Crimson Horizon'
    ];

    return Column(
      children: artists.map((artistName) {
        return _artistCard(artistName);
      }).toList(),
    );
  }

  // Artist Card widget with image and name on the right
  Widget _artistCard(String artistName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/artist_placeholder.png'),
          ),
          SizedBox(width: 10),
          Text(
            artistName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
