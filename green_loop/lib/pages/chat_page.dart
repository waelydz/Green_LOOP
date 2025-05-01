import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D8A8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D8D7A),
        elevation: 0,
        title: const Text(
          'Omer',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: 'Hello! I’m interested in your product.',
                    color: Color(0xFFA3D1C6),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: 'Sure! What would you like to know?',
                    color: Color(0xFFFBFFE4),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF3D8D7A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final Color color;
  final Alignment alignment;

  const ChatBubble({
    required this.message,
    required this.color,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
