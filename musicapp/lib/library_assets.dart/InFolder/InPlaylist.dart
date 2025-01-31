import 'package:flutter/material.dart';
import 'InSong.dart';

class InPlaylistPage extends StatelessWidget {
  final String playlistTitle;
  final String imagePath;

  InPlaylistPage({required this.playlistTitle, required this.imagePath});

  final List<Map<String, String>> songs = [
    {"title": "Ocean Waves", "genre": "Chill", "image": "lib/Images/pic1.jpg"},
    {
      "title": "Late Night Drive",
      "genre": "Lo-Fi",
      "image": "lib/Images/pic2.jpg"
    },
    {
      "title": "Moonlight Serenade",
      "genre": "Jazz",
      "image": "lib/Images/pic3.jpg"
    },
    {"title": "Deep Focus", "genre": "Ambient", "image": "lib/Images/pic4.jpg"},
    {
      "title": "Coffee Shop Vibes",
      "genre": "Acoustic",
      "image": "lib/Images/pic5.jpg"
    },
    {
      "title": "Lost in Time",
      "genre": "Electronic",
      "image": "lib/Images/pic6.jpg"
    },
    {"title": "Dreamscape", "genre": "Indie", "image": "lib/Images/pic7.jpg"},
    {"title": "Heartbeat", "genre": "Pop", "image": "lib/Images/pic8.jpg"},
    {
      "title": "Guitar Dreams",
      "genre": "Instrumental",
      "image": "lib/Images/pic9.jpg"
    },
    {
      "title": "Neon Lights",
      "genre": "Synthwave",
      "image": "lib/Images/pic10.jpg"
    },
  ];

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
        title: Center(
          child: Text(
            "Now Playing",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ),
        actions: [Icon(Icons.more_vert, color: Colors.white)],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Image for the playlist itself
          Image.asset(imagePath, width: 250, height: 250),
          SizedBox(height: 10),
          Text(
            playlistTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("Chill | Lo-Fi | Relax",
              style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(songs[index]["image"]!,
                      width: 50, height: 50),
                  title: Text(
                    songs[index]["title"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(songs[index]["genre"]!,
                      style: TextStyle(color: Colors.grey)),
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InSongPage(
                            songTitle: songs[index]["title"]!,
                            genre: songs[index]["genre"]!,
                            playlistName: playlistTitle, // Pass playlist name
                            songImage: songs[index]["image"]!, // Pass image
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
