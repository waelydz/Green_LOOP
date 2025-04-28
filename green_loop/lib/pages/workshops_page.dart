import 'package:flutter/material.dart';
import 'package:green_loop/pages/chatbot.dart';
import 'package:green_loop/pages/workshop_detail_page.dart'; // Ensure you import your ChatbotPage

class WorkshopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8), // Green background
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Back to previous page
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(
                  'assets/images/profile.jpg'), // User profile picture
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Hello and Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Hello" greeting and name in separate styles
                  const Text(
                    'Hello,',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey, // Gray color for 'Hello'
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Manar A.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black color for the name
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3D8A8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu, color: Colors.black),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search Keyword',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.search, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Title for Workshops
            const Text(
              'Workshops',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Expanded ListView of Workshops
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
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF3D8D7A),
        notchMargin: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Camera icon
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
            // Location icon
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            // Shopping Cart icon
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
            // Group icon
            IconButton(
              icon: const Icon(Icons.group, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ],
        ),
      ),
      // Floating Action Button for the Smart Toy
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF7AC4B2),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.smart_toy),
          iconSize: 35.0,
          color: Colors.black,
          onPressed: () {
            // Navigate to ChatbotPage when "smart_toy" icon is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatbotPage(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                dateTime: 'Date: 27/03/2025, Thursday\nTime: 10 am',
                instructor: 'John Travis', // Example data for frontend design
              ),
            ),
          );
        },
      ),
    );
  }
}
