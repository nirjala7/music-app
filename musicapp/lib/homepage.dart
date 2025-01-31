import 'package:Amplify/Settings.dart';
import 'package:Amplify/TopStatspage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'search_page.dart';
import 'librarypage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeContentPage(),
    SearchPage(),
    LibraryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF001233),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  final String username = "Nirjala"; // Replace with stored username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Text(username,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }),
          IconButton(
            icon: Icon(Icons.bar_chart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopStatsPage()),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF005F73), Color(0xFF001233)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _sectionTitle(context, 'Recently Played'), // Pass context here
                _buildGenreGrid(context),
                _sectionTitle(
                    context, 'Trending Playlist'), // Pass context here
                _buildCarousel(context, [
                  'lib/Images/pic7.jpg',
                  'lib/Images/pic8.jpg',
                  'lib/Images/pic9.jpg',
                ]),
                _sectionTitle(context,
                    'Personalized Recommendations'), // Pass context here
                _buildCarousel(context, [
                  'lib/Images/pic10.jpg',
                  'lib/Images/pic11.jpg',
                  'lib/Images/pic12.jpg',
                ]),
              ],
            ),
          ),
          _buildMusicPlayerBar(context), // Pass context here
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color, // Fixed
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGenreGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Table(
        children: [
          _buildGenreRow(context, 'Pop', 'Rock', 'pic1.jpg', 'pic2.jpg'),
          _buildGenreRow(context, 'Jazz', 'Classical', 'pic3.jpg', 'pic4.jpg'),
          _buildGenreRow(
              context, 'Hip-Hop', 'Electronic', 'pic5.jpg', 'pic6.jpg'),
        ],
      ),
    );
  }

  TableRow _buildGenreRow(BuildContext context, String genre1, String genre2,
      String img1, String img2) {
    return TableRow(
      children: [
        _buildClickableCell(context, 'lib/Images/$img1', genre1),
        _buildClickableCell(context, 'lib/Images/$img2', genre2),
      ],
    );
  }

  Widget _buildClickableCell(
      BuildContext context, String imagePath, String genre) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlankPage(title: genre)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF005F73).withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
            SizedBox(width: 15),
            Text(genre,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, List<String> images) {
    return CarouselSlider(
      items: images.map((image) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BlankPage(title: 'Image ${images.indexOf(image) + 1}')),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset(image, width: 150, height: 150, fit: BoxFit.cover),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget _buildMusicPlayerBar(BuildContext context) {
    return Container(
      height: 60,
      color: Color(0xFF005F73),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            'lib/Images/pic1.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Song Title',
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color, // Dynamic text color
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Artist Name',
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color, // Dynamic text color
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              color: Theme.of(context).iconTheme.color, // Dynamic icon color
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
