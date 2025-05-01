import 'dart:io';
import 'package:flutter/material.dart';
import 'package:green_loop/llm/tutorial_service.dart';
<<<<<<< Updated upstream
import 'package:green_loop/llm/new_services.dart';
import 'package:image_picker/image_picker.dart';
=======
>>>>>>> Stashed changes

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

  void _sendMessage() async {
  final userInput = _controller.text.trim();
  if (userInput.isEmpty) return;

  setState(() {
    messages.add({
      'sender': 'user',
      'message': userInput,
    });
    _controller.clear();
  });

  try {
    // Check if user input includes a tutorial request keyword
    if (userInput.toLowerCase().contains("tutorial")) {
      setState(() {
        messages.add({
          'sender': 'bot',
          'message': 'Creating a recycling tutorial for you... ♻️✨',
        });
      });

      final tutorialSteps = await TutorialService.generateTutorial(userInput);

      for (var step in tutorialSteps) {
        setState(() {
          messages.add({
            'sender': 'bot',
<<<<<<< Updated upstream
            'message': step.stepText,
          });
          messages.add({
            'sender': 'bot',
            'message': step.imageUrl, 
          });
        });
      }
    } else if(userInput.toLowerCase().contains("swap") || userInput.toLowerCase().contains("alternative")){
      setState(() {
        messages.add({
          'sender': 'bot',
          'message': 'Finding ecofriendly alternatives...♻️✨',
        });
      });
      final ecofriendly_swaps = await OpenAIService.suggestAlternatives(userInput);
      setState(() {
          messages.add({
            'sender': 'bot',
            'message': ecofriendly_swaps,
          });
=======
            'message': step.text,
          });
          messages.add({
            'sender': 'bot',
            'message': step.imageUrl, // Later you can display this as image
          });
        });
      }
    } else {
      // Generic fallback
      setState(() {
        messages.add({
          'sender': 'bot',
          'message': 'Thank you! How can I assist you further?',
        });
>>>>>>> Stashed changes
      });
    }
  } catch (e) {
    setState(() {
      messages.add({
        'sender': 'bot',
        'message': 'Oops! Something went wrong: $e',
      });
    });
<<<<<<< Updated upstream
  }
}

Future<void> _processImage(File imageFile) async {
  setState(() {
    messages.add({'sender': 'user', 'message': '[Image loaded]'});
    messages.add({'sender': 'bot', 'message': 'Analyzing image, please wait...'});
  });

  try {
    final response = await OpenAIService.analyzeImage(imageFile);
    setState(() {
      messages.removeLast();
      messages.add({'sender': 'bot', 'message': response});
    });
  } catch (e) {
    setState(() {
      messages.removeLast();
      messages.add({'sender': 'bot', 'message': 'Sorry, I couldn’t process the image. Please try again.'});
    });
  }
}

Future<void> _handleCameraAction() async {
    final picker = ImagePicker();

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? file = await picker.pickImage(
                      source: ImageSource.camera, imageQuality: 80);
                  if (file != null) _processImage(File(file.path));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? file = await picker.pickImage(
                      source: ImageSource.gallery, imageQuality: 80);
                  if (file != null) _processImage(File(file.path));
                },
              ),
            ],
          ),
        );
      },
    );
=======
>>>>>>> Stashed changes
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
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color:
                          isUserMessage ? Color(0xFFA3D1C6) : Color(0xFFFBFFE4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: message['message']!.startsWith('http')
                    ? Image.network(message['message']!)
                    : Text(
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
                      onPressed: _handleCameraAction,
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
