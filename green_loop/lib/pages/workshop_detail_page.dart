import 'package:flutter/material.dart';
import 'package:green_loop/pages/chatbot.dart'; // Correct import for ChatbotPage

class WorkshopDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String dateTime; // Placeholder for frontend design
  final String instructor;

  const WorkshopDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.instructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8), // Green background
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Colors.black), // Back icon
          onPressed: () => Navigator.pop(context), // Go back to previous page
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
        child: Center(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align content in the center
            children: [
              // Workshop Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Workshop Image (Static image for frontend design)
              Image.asset('assets/images/home_decor.jpg',
                  height: 200, fit: BoxFit.cover),
              const SizedBox(height: 12),

              // Description (Static text for frontend design)
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Date, Time, Instructor Section (Centered for frontend design)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the contents vertically
                children: [
                  // Date Section
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.black, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        dateTime, // Static value for frontend
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Instructor Section
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    children: [
                      const Icon(Icons.person, color: Colors.black, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        "Instructor: $instructor", // Static value for frontend
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Time Section
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    children: [
                      const Icon(Icons.access_time,
                          color: Colors.black, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'Time: 10 am',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Register Now Button (Static for frontend design)
              ElevatedButton(
                onPressed: () {
                  print("Registered for $title Workshop");
                },
                child: const Text("Register Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D8D7A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF3D8D7A),
        notchMargin: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.black),
                iconSize: 30.0,
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.location_on, color: Colors.black),
                iconSize: 30.0,
                onPressed: () {}),
            const SizedBox(width: 40),
            IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                iconSize: 30.0,
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.group, color: Colors.black),
                iconSize: 30.0,
                onPressed: () {}),
          ],
        ),
      ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatbotPage()),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
