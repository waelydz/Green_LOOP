import 'package:flutter/material.dart';
import 'workshop_detail_page.dart'; // Correct import for WorkshopDetailPage

class WorkshopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8), // Green background
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Go back to previous page
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('picture here'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Our Workshops",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildWorkshopItem(
                    context,
                    "Home Decor 🏡",
                    "Transform Your Home with Unique Decor",
                    "Discover the art of giving old, forgotten items a new life in our Home Decor Upcycling workshop!",
                  ),
                  _buildWorkshopItem(
                    context,
                    "Clothing and Accessories 👗",
                    "Revamp, Restyle, Rewear: Upcycling Clothing and Accessories",
                    "Breathe new life into your wardrobe with our Clothing & Accessories Upcycling workshop!",
                  ),
                  _buildWorkshopItem(
                    context,
                    "Kids and Crafts 🧸",
                    "Play It Again: Upcycling Toys for Fun and Creativity",
                    "Don't toss those old toys — transform them! Join our Toys Upcycling workshop and learn how to turn forgotten or broken toys into fun, creative, and functional masterpieces.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkshopItem(
    BuildContext context,
    String title,
    String subtitle,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkshopDetailPage(
                title: title,
                description: description,
                dateTime: 'Static Date', // Placeholder for backend
                instructor: 'Instructor Name',
              ),
            ),
          );
        },
      ),
    );
  }
}
