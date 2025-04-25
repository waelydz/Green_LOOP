import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  // Function to show modal dialog with text
  void _showJourneyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.transparent, // Make the background transparent
          elevation: 0,
          content: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:
                  Colors.grey.withOpacity(0.5), // Gray background for the modal
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Begin your recycling",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "journey!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Add user message
        messages.add({
          'sender': 'user',
          'message': _controller.text,
        });

        // Bot response simulation with a delay
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            messages.add({
              'sender': 'bot',
              'message': 'Thank you! How can I assist you further?',
            });
          });
        });

        // Clear the text field after sending the message
        _controller.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Show modal dialog when page is loaded
    Future.delayed(Duration.zero, () {
      _showJourneyDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8), // Green background
        elevation: 0,
        title:
            const Text("Green Loop Bot", style: TextStyle(color: Colors.black)),
        actions: [
          // Only the user icon on the right side of the AppBar
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Colors.black), // User icon
            onPressed: () {
              // Define what happens when the user icon is pressed (e.g., navigate to profile page)
              print("User icon clicked");
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFB3D8A8), // Green background
      body: Column(
        children: [
          // Chat messages display
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message['sender'] == 'user';

                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color:
                          isUserMessage ? Color(0xFFA3D1C6) : Color(0xFFFBFFE4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message['message']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          // This is the "chat input field" with a separated background design
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(
                    0xFF3D8D7A), // Green background for the input background
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    // Camera icon (or any icon you want on the left)
                    IconButton(
                      icon: const Icon(Icons.camera_alt,
                          color: Colors.white), // Camera icon
                      onPressed: () {
                        // You can define what happens here
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Message Green Loop Bot",
                          hintStyle:
                              TextStyle(color: Colors.white), // Hint text color
                          border:
                              InputBorder.none, // No border for the input field
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send,
                          color: Colors.white), // White send icon
                      onPressed: _sendMessage, // Send the message
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
