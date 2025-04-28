import 'package:flutter/material.dart';
import 'package:green_loop/pages/chatbot.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int userPoints = 3407; // User's current points

  // List of rewards
  List<Map<String, dynamic>> rewards = [
    {'points': 4570, 'description': 'Free Matcha from Claro', 'type': 'food'},
    {
      'points': 3120,
      'description': '1-Day Pass for FitnessFirst',
      'type': 'fitness'
    },
    {
      'points': 1650,
      'description': '15% Off in Sharjah CO-OP Society',
      'type': 'shopping'
    },
    {
      'points': 7040,
      'description': '50% When Ordering from Noon',
      'type': 'shopping'
    },
    {
      'points': 520,
      'description': 'Free Donut from Krispy Kreme',
      'type': 'food'
    },
  ];

  bool sortLowToHigh = false; // Sorting toggle

  @override
  Widget build(BuildContext context) {
    // Sort the rewards
    List<Map<String, dynamic>> sortedRewards = List.from(rewards);
    if (sortLowToHigh) {
      sortedRewards.sort((a, b) => a['points'].compareTo(b['points']));
    } else {
      sortedRewards.sort((a, b) => b['points'].compareTo(a['points']));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFB3D8A8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Rewards',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 12),
            child: Row(
              children: [
                const Icon(Icons.shopping_bag, color: Colors.black, size: 18),
                const SizedBox(width: 4),
                Text(
                  '$userPoints pts',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: userPoints / 10000,
              backgroundColor: Colors.white,
              color: const Color(0xFF3D8D7A),
              minHeight: 8,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      sortLowToHigh = !sortLowToHigh;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.sort, size: 18, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(
                        sortLowToHigh ? "Low to High" : "High to Low",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: sortedRewards.length,
                itemBuilder: (context, index) {
                  final reward = sortedRewards[index];
                  return _buildRewardItem(
                    reward['points'].toString(),
                    reward['description'],
                    reward['type'],
                  );
                },
              ),
            ),
          ],
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

  Widget _buildRewardItem(String points, String description, String type) {
    IconData rewardIcon;
    if (type == 'food') {
      rewardIcon = Icons.fastfood;
    } else if (type == 'fitness') {
      rewardIcon = Icons.fitness_center;
    } else {
      rewardIcon = Icons.shopping_bag;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side: Icon + Points
          Row(
            children: [
              Icon(rewardIcon, color: Colors.black, size: 30),
              const SizedBox(width: 8),
              Text(
                '$points pts',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Vertical divider
          Container(
            height: 50,
            width: 1,
            color: Colors.grey,
          ),
          const SizedBox(width: 16),
          // Right side: Description + Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _showRedeemPopup(description);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D8D7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Redeem Now',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Popup when Redeem button is clicked
  void _showRedeemPopup(String rewardName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redeem Reward'),
        content: Text('Congratulations! You redeemed: $rewardName'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
