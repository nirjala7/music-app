import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  // Function to build a clickable cell for genres and recently searched items
  Widget buildClickableCell(
      BuildContext context, String imagePath, String genre, Color color) {
    return GestureDetector(
      onTap: () {
        // Navigate to Details Page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Blank_Page(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color, // Set the background color dynamically
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Text and label on the left
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  genre, // Genre name
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
            // Image on the right
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath, // Unique image for each genre
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
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
                  // Logo on the left
                  Image.asset(
                    "lib/Images/logo.png", // Replace with your logo path
                    width: 100,
                    height: 50,
                  ),
                  // "Search" text in the center
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 40), // Space to balance layout
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
              // Search Bar with Search Icon
              TextField(
                style: TextStyle(
                    color: Colors.black), // Set typed text color to dark
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Colors.white, // Background color of the search field
                  hintText: 'Search here...',
                  hintStyle: TextStyle(color: Colors.grey), // Placeholder color
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey, // Icon color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),

              // Title for Recently Searched
              Text(
                "Recently Searched",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),

              // Recently Searched Containers
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
                    "lib/Images/pic4.jpg",
                  ];
                  List<String> genres = [
                    'Jazz',
                    'Classic',
                    'Hip-Hop',
                    'Electro',
                  ];
                  List<Color> colors = [
                    Colors.redAccent,
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.orangeAccent,
                  ];

                  return buildClickableCell(
                    context,
                    images[index],
                    genres[index],
                    colors[index], // Pass different color to each cell
                  );
                },
              ),
              SizedBox(height: 20),

              // Title for Genre Section
              Text(
                "Genre",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),

              // Genre Containers with additional rows
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: 7, // Increased to 7 to add 3 more rows
                itemBuilder: (context, index) {
                  List<String> genreImages = [
                    "lib/Images/pic5.jpg",
                    "lib/Images/pic6.jpg",
                    "lib/Images/pic7.jpg",
                    "lib/Images/pic8.jpg",
                    "lib/Images/pic9.jpg",
                    "lib/Images/pic10.jpg",
                    "lib/Images/pic11.jpg",
                  ];
                  List<String> genreList = [
                    'Rock',
                    'Pop',
                    'Jazz',
                    'Classi',
                    'R&Bs',
                    'Blues',
                    'Soul',
                  ];
                  List<Color> genreColors = [
                    Colors.redAccent,
                    Colors.purpleAccent,
                    Colors.yellowAccent,
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.cyanAccent,
                    Colors.orangeAccent,
                  ];

                  return buildClickableCell(
                    context,
                    genreImages[index],
                    genreList[index],
                    genreColors[index], // Pass different color to each genre
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Blank_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
      ),
      body: Center(
        child: Text('This is a blank page'),
      ),
    );
  }
}
