import 'package:flutter/material.dart';
import 'addtoPlaylist.dart'; // Import the addPlaylist page
import 'sleeptimer.dart'; // Import the sleepTimer page

class SongMenuPage extends StatefulWidget {
  final String songTitle;
  final String genre;
  final String songImage;

  SongMenuPage({
    required this.songTitle,
    required this.genre,
    required this.songImage,
  });

  @override
  _SongMenuPageState createState() => _SongMenuPageState();
}

class _SongMenuPageState extends State<SongMenuPage> {
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
        title: Text(
          'Song Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the entire body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Song Image - centered at the top (using widget.songImage)
              Center(
                child: Image.asset(
                  widget.songImage, // Loading image from widget.songImage
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Song Title (using widget.songTitle)
              Text(
                widget.songTitle, // Loading title from widget.songTitle
                style: TextStyle(
                  color: Colors.white, // Text color white
                  fontSize: 26, // Increased size for better visibility
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Song Genre (using widget.genre)
              Text(
                widget.genre, // Loading genre from widget.genre
                style: TextStyle(
                  color: Colors.white54, // Text color white with lower opacity
                  fontSize: 18, // Slightly larger size for readability
                ),
              ),
              SizedBox(height: 30), // Space before options section

              // Options Section (updated to use ListView directly)
              Column(
                children: [
                  _buildOptionButton(
                    context,
                    icon: Icons.playlist_add,
                    label: 'Add to Playlist',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPlaylistPage(),
                        ),
                      );
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.queue_music,
                    label: 'Add to Queue',
                    onTap: () {
                      // Handle Add to Queue action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.remove_circle_outline,
                    label: 'Remove from Playlist',
                    onTap: () {
                      // Handle Remove from Playlist action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.edit,
                    label: 'Modify Tags',
                    onTap: () {
                      // Handle Modify Tags action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.account_circle,
                    label: 'View Artist',
                    onTap: () {
                      // Handle View Artist action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.album,
                    label: 'View Album',
                    onTap: () {
                      // Handle View Album action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.card_giftcard,
                    label: 'Show Credits',
                    onTap: () {
                      // Handle Show Credits action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.download,
                    label: 'Download',
                    onTap: () {
                      // Handle Download action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.share,
                    label: 'Share',
                    onTap: () {
                      // Handle Share action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.qr_code,
                    label: 'Generate QR Code',
                    onTap: () {
                      // Handle Generate QR Code action
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.timer,
                    label: 'Sleep Timer',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SleepTimerPage(),
                        ),
                      );
                    },
                  ),
                  _buildOptionButton(
                    context,
                    icon: Icons.visibility_off,
                    label: 'Hide Song',
                    onTap: () {
                      // Handle Hide Song action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build each option button with white text and icons
  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white, // Ensure icons are white
              size: 28, // Adjusted icon size
            ),
            SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                color: Colors.white, // Ensure text is white
                fontSize: 18, // Adjusted text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
