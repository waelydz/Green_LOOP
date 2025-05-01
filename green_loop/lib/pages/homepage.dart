import 'package:flutter/material.dart';
import 'Profile.dart';
import 'green_market_home.dart';
import 'chatbot.dart';
import 'workshops_page.dart';
import 'RewardsPage.dart';
import 'Rewards_colector.dart';
import 'ReportProblemPage.dart';
import 'NewsPage.dart';
import 'CommunityPage.dart';
import 'SupportCenterPage.dart';
import 'MiniGame.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _showMenu = false;
  bool _showNotifications = false;
  double _menuOpacity = 0;
  double _notificationsOpacity = 0;
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;

  void _toggleMenu() {
    setState(() {
      _showMenu = !_showMenu;
      _menuOpacity = _showMenu ? 1 : 0;
      _showNotifications = false;
      _notificationsOpacity = 0;
    });
  }

  void _toggleNotifications() {
    setState(() {
      _showNotifications = !_showNotifications;
      _notificationsOpacity = _showNotifications ? 1 : 0;
      _showMenu = false;
      _menuOpacity = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _fabAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          _showMenu = false;
          _menuOpacity = 0;
        });

        if (title == "Profile") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        } else if (title == "Green Market") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => GreenMarketHomePage()));
        } else if (title == "Workshops") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopsPage()));
        } else if (title == "Rewards") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RewardsPage()));
        } else if (title == "Report Problem") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblemPage()));
        } else if (title == "News") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
        } else if (title == "Support Center") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SupportCenterPage()));
        } else if (title == "Mini Game") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Landing()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
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
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/leaves_background.png', fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Green Loop", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(height: 12),
                Text("Where Every Cycle", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Color.fromARGB(255, 80, 77, 77))),
                Text("Creates Change", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Color.fromARGB(255, 80, 77, 77))),
                SizedBox(height: 30),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _showMenu ? 48 : -400,
            left: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _menuOpacity,
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
                    _buildMenuItem("Mini Game", Icons.videogame_asset),
                    _buildMenuItem("Rewards", Icons.card_giftcard),
                    _buildMenuItem("Support Center", Icons.support),
                    _buildMenuItem("Report Problem", Icons.report_problem),
                  ],
                ),
              ),
            ),
          ),
          if (_showNotifications)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: _showNotifications ? 48 : -400,
              right: 10,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _notificationsOpacity,
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3D8D7A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("New workshop added", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 8),
                      Text("Check out the latest news", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 8),
                      Text("Dr. Manar reacted to your post", style: TextStyle(color: Colors.white)),
                    ],
                  ),
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RewodsCollectorPage()));
              },
            ),
            IconButton(icon: const Icon(Icons.location_on, color: Colors.black), iconSize: 30.0, onPressed: () {}),
            const SizedBox(width: 40),
            IconButton(icon: const Icon(Icons.shopping_cart, color: Colors.black), iconSize: 30.0, onPressed: () {}),
            IconButton(
              icon: const Icon(Icons.group, color: Colors.black),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabAnimation,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF7AC4B2),
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: IconButton(
            icon: const Icon(Icons.smart_toy),
            iconSize: 35.0,
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotPage()));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
