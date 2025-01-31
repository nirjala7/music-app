import 'package:flutter/material.dart';
import 'InFolder/infolderpage.dart'; // Import the page to navigate to

class FoldersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecentlyPlayedSection(context), // Pass context
          SizedBox(height: 20),
          _buildNavigableSection(context, "Moods", "11 playlists",
              "lib/Images/pic1.jpg"), // Make "Moods" clickable
          SizedBox(height: 20),
          _buildSection(context, "Blends", "8 playlists",
              "lib/Images/pic2.jpg"), // Pass context
          SizedBox(height: 20),
          _buildSection(context, "Favs", "14 playlists",
              "lib/Images/pic3.jpg"), // Pass context
          SizedBox(height: 20),
          _buildSection(context, "Random?", "10 playlists",
              "lib/Images/pic4.jpg"), // Pass context
        ],
      ),
    );
  }

  Widget _buildRecentlyPlayedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.swap_vert,
              color: Theme.of(context).iconTheme.color, // Dynamic icon color
              size: 24,
            ),
            SizedBox(width: 10),
            Text(
              'Recently Played',
              style: TextStyle(
                color: Color(0xFF00C2CB), // Keep this color if it's intentional
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // Regular section (for Blends, Favs, Random?)
  Widget _buildSection(
      BuildContext context, String title, String subtitle, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.color, // Dynamic text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey, // Keep this color if it's intentional
          fontSize: 14,
        ),
      ),
    );
  }

  // Clickable "Moods" section
  Widget _buildNavigableSection(
      BuildContext context, String title, String subtitle, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InFolderPage(title: title)),
        );
      },
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.color, // Dynamic text color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey, // Keep this color if it's intentional
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
