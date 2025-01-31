import 'package:flutter/material.dart';
import 'library_assets.dart/folder.dart';
import 'library_assets.dart/playlist.dart';
import 'library_assets.dart/artist.dart';
import 'library_assets.dart/albums.dart';
import 'library_assets.dart/newPlaylist.dart';
import 'library_assets.dart/likedsongs.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _currentPageIndex = 0;
  int _selectedButton = 0; // Track the currently selected button
  final List<Widget> _pages = [
    FoldersPage(),
    PlaylistsPage(),
    ArtistsPage(),
    AlbumsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Dynamic background color
      body: Column(
        children: [
          // Top Bar with Logo and Title
          _buildTopBar(context),

          // Navigation Buttons
          _buildNavigationButtons(context),

          // Library Content (Top part stays the same)
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddNewPlaylistButton(context), // Pass context
                    SizedBox(height: 20),
                    _buildYourLikedSongsButton(context), // Pass context
                    SizedBox(height: 20),

                    // Dynamic Content Section (Sliding Effect)
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _pages[_currentPageIndex],
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF005F73), Color(0xFF001233)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Image.asset('lib/Images/logo.png', width: 50, height: 50),
          SizedBox(width: 10),
          Text(
            'YOUR LIBRARY',
            style: TextStyle(
              color: Color(0xFF00C2CB),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navButton(context, "Folders", 0),
          _navButton(context, "Playlists", 1),
          _navButton(context, "Artists", 2),
          _navButton(context, "Albums", 3),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, int pageIndex) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final Color outlineColor =
        isDarkTheme ? Colors.white : Colors.black; // Dynamic outline color

    return GestureDetector(
      onTap: () {
        setState(() {
          // If the same button is clicked again, reset to default (FoldersPage)
          if (_selectedButton == pageIndex) {
            _currentPageIndex = 0;
            _selectedButton = 0;
          } else {
            _currentPageIndex = pageIndex;
            _selectedButton = pageIndex;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedButton == pageIndex
                ? Color(0xFF00C2CB)
                : outlineColor, // Dynamic outline color
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedButton == pageIndex
                ? Color(0xFF00C2CB)
                : outlineColor, // Dynamic text color
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewPlaylistButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NewPlaylistPage()), // Navigate to newPlaylist.dart
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Dynamic card color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFF00C2CB), shape: BoxShape.circle),
              child: Icon(Icons.add, color: Colors.black, size: 40),
            ),
            SizedBox(width: 10),
            Text(
              'Add New Playlist',
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color, // Dynamic text color
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYourLikedSongsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LikedSongsPage()), // Navigate to likedsongs.dart
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Dynamic card color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xFF00C2CB), shape: BoxShape.circle),
              child: Icon(Icons.favorite, color: Colors.black, size: 25),
            ),
            SizedBox(width: 10),
            Text(
              'Your Liked Songs',
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color, // Dynamic text color
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
