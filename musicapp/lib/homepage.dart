import 'package:flutter/material.dart';
import 'librarypage.dart';
import 'search_page.dart';
import 'TopStatspage.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    SearchPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 64, 145, 211),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Nirjala',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications action
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Handle settings action
            },
          ),
          IconButton(
            icon: Icon(Icons.bar_chart,
                color: Colors.white), // Three vertical bars icon
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
              colors: [Colors.blue.shade800, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Recently Played',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              children: [
                TableRow(
                  children: [
                    _buildClickableCell(context, 'lib/Images/pic1.jpg', 'Pop'),
                    _buildClickableCell(context, 'lib/Images/pic2.jpg', 'Rock'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildClickableCell(context, 'lib/Images/pic3.jpg', 'Jazz'),
                    _buildClickableCell(
                        context, 'lib/Images/pic4.jpg', 'Classical'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildClickableCell(
                        context, 'lib/Images/pic5.jpg', 'Hip-Hop'),
                    _buildClickableCell(
                        context, 'lib/Images/pic6.jpg', 'Electronic'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Trending Playlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildCarousel(context, [
            'lib/Images/pic7.jpg',
            'lib/Images/pic8.jpg',
            'lib/Images/pic9.jpg',
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Personalized Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildCarousel(context, [
            'lib/Images/pic10.jpg',
            'lib/Images/pic11.jpg',
            'lib/Images/pic12.jpg',
          ]),
        ],
      ),
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
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            Text(
              genre,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, List<String> images) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BlankPage(title: 'Image ${index + 1}')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  images[index],
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
