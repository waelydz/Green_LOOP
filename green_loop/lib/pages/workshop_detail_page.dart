import 'package:flutter/material.dart';
import 'package:green_loop/pages/CommunityPage.dart';
import 'package:green_loop/pages/chatbot.dart';
import 'package:green_loop/pages/Rewards_colector.dart';

class WorkshopDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String dateTime;
  final String instructor;

  const WorkshopDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.instructor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 12),
              Image.asset('assets/images/home_decor.jpg',
                  height: 200, fit: BoxFit.cover),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 8),
                      Text(dateTime,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, size: 18),
                      const SizedBox(width: 8),
                      Text("Instructor: $instructor",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 8),
                      const Text('Time: 10 am',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color(0xFFB3D8A8),
                        title: const Text('Success', style: TextStyle(color: Colors.black)),
                        content: const Text('You have registered successfully!', style: TextStyle(color: Colors.black87)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D8D7A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Register Now"),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RewodsCollectorPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.group, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommunityPage()));
              },
            ),
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
                offset: const Offset(0, 4))
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.smart_toy),
          iconSize: 35.0,
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatbotPage()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
