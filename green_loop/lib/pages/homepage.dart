import 'package:flutter/material.dart';
import 'Profile.dart';
import 'green_market_home.dart';
import 'chatbot.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  bool _showNotifications = false;

  void _toggleMenu() {
    setState(() {
      _showMenu = !_showMenu;
      _showNotifications = false;
    });
  }

  void _toggleNotifications() {
    setState(() {
      _showNotifications = !_showNotifications;
      _showMenu = false;
    });
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          _showMenu = false;
        });

        if (title == "Profile") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        } else if (title == "Green Market") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GreenMarketHomePage()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D8A8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                iconSize: 28.0,
                onPressed: _toggleMenu,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            iconSize: 30.0,
            onPressed: _toggleNotifications,
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Green Loop",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Where Every Cycle",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 80, 77, 77),
                  ),
                ),
                const Text(
                  "Creates Change",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 80, 77, 77),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          if (_showMenu)
            Positioned(
              top: 65,
              left: 18,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF3D8D7A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildMenuItem("Profile", Icons.person),
                    _buildMenuItem("Green Market", Icons.store),
                    _buildMenuItem("Workshops", Icons.work),
                    _buildMenuItem("News", Icons.article),
                    _buildMenuItem("Mini Games", Icons.videogame_asset),
                    _buildMenuItem("Support Center", Icons.support),
                    _buildMenuItem("Report Problem", Icons.report_problem),
                  ],
                ),
              ),
            ),
          if (_showNotifications)
            Positioned(
              top: 70,
              right: 10,
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF3D8D7A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _toggleNotifications,
                      child: const Text("New workshop added",
                          style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _toggleNotifications,
                      child: const Text("Check out the latest news",
                          style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _toggleNotifications,
                      child: const Text("Dr. Manar reacted to your post",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
        ],
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
              onPressed: () {},
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
              onPressed: () {},
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
                  builder: (context) =>
                      ChatbotPage()), // Corrected navigation to ChatbotPage
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
