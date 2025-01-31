import 'package:flutter/material.dart';
import 'songmenu_page.dart';

class InSongPage extends StatefulWidget {
  final String songTitle;
  final String genre;
  final String playlistName;
  final String songImage;

  InSongPage({
    required this.songTitle,
    required this.genre,
    required this.playlistName,
    required this.songImage,
  });

  @override
  _InSongPageState createState() => _InSongPageState();
}

class _InSongPageState extends State<InSongPage> {
  bool isLiked = false; // Heart icon state
  double progress = 0.3; // Mock progress bar

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align to the left
          children: [
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  "Playing from playlist: ",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  widget.playlistName,
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(), // To push the three vertical dots to the right side
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Navigate to the song menu screen and pass the required parameters
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongMenuPage(
                      songTitle: widget.songTitle,
                      genre: widget.genre,
                      songImage: widget.songImage, // Passing song image
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [SizedBox(width: 40)], // Keeps title centered
      ),
      body: SingleChildScrollView(
        // Make the whole body scrollable
        child: Column(
          children: [
            SizedBox(height: 30),
            // Song Image
            Center(
              child: Image.asset(
                widget.songImage,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Song Title & Subtitle (Genre)
            Text(
              widget.songTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.genre,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.share, color: Colors.white, size: 20),
                    SizedBox(width: 15),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.deepPurpleAccent : Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Mock Progress Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Slider(
                    value: progress,
                    onChanged: (value) {},
                    min: 0,
                    max: 1,
                    activeColor: Colors.deepPurpleAccent,
                    inactiveColor: Colors.grey.shade800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1:15",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("3:45",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Music Controls (Bigger icons in the center)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shuffle, color: Colors.white, size: 24),
                SizedBox(width: 30),
                Icon(Icons.skip_previous, color: Colors.white, size: 30),
                SizedBox(width: 30),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 36),
                ),
                SizedBox(width: 30),
                Icon(Icons.skip_next, color: Colors.white, size: 30),
                SizedBox(width: 30),
                Icon(Icons.add, color: Colors.white, size: 24),
              ],
            ),
            SizedBox(height: 20),
            // Lyrics Section
            Text("Lyrics",
                style: TextStyle(color: Colors.white54, fontSize: 14)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                // Added scrolling for lyrics
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
