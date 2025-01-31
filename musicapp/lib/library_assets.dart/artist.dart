import 'package:flutter/material.dart';

class ArtistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildArtistSection(context),
          SizedBox(height: 20),
          _buildSection(context, "Conan Gray", "lib/Images/pic9.jpg"),
          SizedBox(height: 20),
          _buildSection(context, "Chase Atlantic", "lib/Images/pic10.jpg"),
          SizedBox(height: 20),
          _buildSection(context, "Beabadoobee", "lib/Images/pic11.jpg"),
          SizedBox(height: 20),
          _buildSection(context, "Keshi", "lib/Images/pic12.jpg"),
        ],
      ),
    );
  }

  Widget _buildArtistSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.swap_vert,
                color: Theme.of(context).iconTheme.color, size: 24),
            SizedBox(width: 10),
            Text(
              'Recently Played',
              style: TextStyle(
                  color: Color(0xFF00C2CB),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSection(BuildContext context, title, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
