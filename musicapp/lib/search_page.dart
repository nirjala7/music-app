import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Dynamic background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF102B2D), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/Images/logo.png", width: 100, height: 50),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color, // Dynamic text color
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search here...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Recently Searched",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color, // Dynamic text color
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<String> images = [
                    "lib/Images/pic1.jpg",
                    "lib/Images/pic2.jpg",
                    "lib/Images/pic3.jpg",
                    "lib/Images/pic4.jpg"
                  ];
                  List<String> genres = [
                    'Jazz',
                    'Classic',
                    'Hip-Hop',
                    'Electro'
                  ];
                  List<Color> colors = [
                    Colors.redAccent,
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.orangeAccent
                  ];
                  return _buildClickableCell(
                      context, images[index], genres[index], colors[index]);
                },
              ),
              SizedBox(height: 20),
              Text(
                "Genre",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color, // Dynamic text color
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  List<String> genreImages = [
                    "lib/Images/pic5.jpg",
                    "lib/Images/pic6.jpg",
                    "lib/Images/pic7.jpg",
                    "lib/Images/pic8.jpg",
                    "lib/Images/pic9.jpg",
                    "lib/Images/pic10.jpg",
                    "lib/Images/pic11.jpg"
                  ];
                  List<String> genreList = [
                    'Rock',
                    'Pop',
                    'Jazz',
                    'Classi',
                    'R&Bs',
                    'Blues',
                    'Soul'
                  ];
                  List<Color> genreColors = [
                    Colors.redAccent,
                    Colors.purpleAccent,
                    Colors.yellowAccent,
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.cyanAccent,
                    Colors.orangeAccent
                  ];
                  return _buildClickableCell(context, genreImages[index],
                      genreList[index], genreColors[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableCell(
      BuildContext context, String imagePath, String genre, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlankPage(title: genre)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  genre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.black,
                        offset: Offset(1.5, 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath,
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  final String title;
  BlankPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title Page (Under Construction)',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
