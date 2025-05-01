import 'package:flutter/material.dart';

class RewodsCollectorPage extends StatefulWidget {
  final int points;

  const RewodsCollectorPage({super.key, required this.points});

  @override
  State<RewodsCollectorPage> createState() => _RewodsCollectorPageState();
}

class _RewodsCollectorPageState extends State<RewodsCollectorPage>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late int earnedPoints;
  late AnimationController _controller;
  late Animation<double> _fireworkAnimation;

  @override
  void initState() {
    super.initState();
    earnedPoints = widget.points;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _fireworkAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FBEF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildCurrentPage(),
    );
  }

  Widget _buildCurrentPage() {
    if (currentPage == 0) {
      return _buildCounterPage();
    } else if (currentPage == 1) {
      return _buildThankYouPage();
    } else {
      return _buildLeaderboardPage();
    }
  }

  Widget _buildCounterPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Item Counter',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '0',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Points Earned',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$earnedPoints',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentPage = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3D8A8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThankYouPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _fireworkAnimation,
            child: Image.asset(
              'assets/images/fireworks.png',
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Thank you',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'for Recycling!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            'Points Earned: $earnedPoints',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3D8A8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Show Leaderboard',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3D8A8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Go Back to Homepage',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardPage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Leaderboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildLeaderItem('Wael', '3407', 1),
                _buildLeaderItem('Sarah', '1103', 2),
                _buildLeaderItem('Shahd', '892', 3),
                _buildLeaderItem('Ahmed', '727', 4),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3D8A8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Collect Rewards',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildLeaderItem(String name, String points, int rank) {
    Icon? rankIcon;
    if (rank == 1) {
      rankIcon = const Icon(Icons.emoji_events, color: Colors.amber);
    } else if (rank == 2) {
      rankIcon = const Icon(Icons.emoji_events, color: Colors.grey);
    } else if (rank == 3) {
      rankIcon = const Icon(Icons.emoji_events, color: Colors.brown);
    }

    return Card(
      elevation: 3,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF7AC4B2),
          child: Text(
            name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text('Points: $points'),
        trailing: rankIcon ??
            Text('#$rank', style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
