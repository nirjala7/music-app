import 'package:flutter/material.dart';
import 'homepage.dart';

class TopStatsPage extends StatefulWidget {
  @override
  _TopStatePageState createState() => _TopStatePageState();
}

class _TopStatePageState extends State<TopStatsPage> {
  int selectedCategory = 0; // 0 = Tracks, 1 = Artists, 2 = Albums
  int selectedDuration = 0; // 0 = 1 month, 1 = 6 months, 2 = 12 months

  List<String> categories = ["Tracks", "Artists", "Albums"];
  List<String> durations = ["1 Month", "6 Months", "12 Months"];

  List<String> tracks = [
    'Blinding Lights - The Weeknd',
    'Shape of You - Ed Sheeran',
    'Levitating - Dua Lipa',
    'Peaches - Justin Bieber',
    'Save Your Tears - The Weeknd',
    'Good 4 U - Olivia Rodrigo',
    'Kiss Me More - Doja Cat',
    'Watermelon Sugar - Harry Styles',
    'Montero (Call Me By Your Name) - Lil Nas X',
    'Stay - Kid LAROI & Justin Bieber',
    'Industry Baby - Lil Nas X & Jack Harlow',
    'Bad Guy - Billie Eilish',
    'Butter - BTS',
    'As It Was - Harry Styles',
    'Need to Know - Doja Cat',
  ];

  List<Map<String, String>> artistItems = [
    {'name': 'The Weeknd', 'image': 'lib/Images/pic1.jpg'},
    {'name': 'Ed Sheeran', 'image': 'lib/Images/pic2.jpg'},
    {'name': 'Dua Lipa', 'image': 'lib/Images/pic3.jpg'},
    {'name': 'Justin Bieber', 'image': 'lib/Images/pic4.jpg'},
    {'name': 'Olivia Rodrigo', 'image': 'lib/Images/pic5.jpg'},
    {'name': 'Doja Cat', 'image': 'lib/Images/pic6.jpg'},
    {'name': 'Harry Styles', 'image': 'lib/Images/pic7.jpg'},
    {'name': 'Lil Nas X', 'image': 'lib/Images/pic8.jpg'},
    {'name': 'Billie Eilish', 'image': 'lib/Images/pic9.jpg'},
    {'name': 'BTS', 'image': 'lib/Images/pic10.jpg'},
  ];

  List<Map<String, String>> albumItems = [
    {'name': 'After Hours - The Weeknd', 'image': 'lib/Images/pic1.jpg'},
    {'name': 'Divide - Ed Sheeran', 'image': 'lib/Images/pic2.jpg'},
    {'name': 'Future Nostalgia - Dua Lipa', 'image': 'lib/Images/pic3.jpg'},
    {'name': 'Justice - Justin Bieber', 'image': 'lib/Images/pic4.jpg'},
    {'name': 'SOUR - Olivia Rodrigo', 'image': 'lib/Images/pic5.jpg'},
    {'name': 'Planet Her - Doja Cat', 'image': 'lib/Images/pic6.jpg'},
    {'name': 'Fine Line - Harry Styles', 'image': 'lib/Images/pic7.jpg'},
    {'name': 'Montero - Lil Nas X', 'image': 'lib/Images/pic8.jpg'},
    {'name': 'Bad Guy - Billie Eilish', 'image': 'lib/Images/pic9.jpg'},
    {'name': 'BE - BTS', 'image': 'lib/Images/pic10.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text(
              'Top',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Past 30 Days',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categories.map((category) {
                int index = categories.indexOf(category);
                bool isSelected = index == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected
                                ? Color.fromARGB(255, 0, 100, 200)
                                : Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            width: 30,
                            height: 2,
                            color: Color.fromARGB(255, 0, 100, 200),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: selectedCategory == 1
                ? ListView.builder(
                    itemCount: artistItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                artistItems[index]['image']!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 16),
                              Text(
                                '#${index + 1} ${artistItems[index]['name']!}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : selectedCategory == 2
                    ? ListView.builder(
                        itemCount: albumItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    albumItems[index]['image']!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '#${index + 1} ${albumItems[index]['name']!}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: tracks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: Text(
                                '#${index + 1} ${tracks[index]}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: durations.map((duration) {
              int index = durations.indexOf(duration);
              bool isSelected = index == selectedDuration;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedDuration = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected
                              ? Color.fromARGB(255, 0, 100, 200)
                              : Colors.white,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          width: 30,
                          height: 2,
                          color: Color.fromARGB(255, 0, 100, 200),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
