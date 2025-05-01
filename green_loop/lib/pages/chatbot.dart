import 'dart:io';
import 'package:flutter/material.dart';
import 'package:green_loop/llm/tutorial_service.dart';
import 'package:green_loop/llm/new_services.dart';
import 'package:image_picker/image_picker.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage>
    with TickerProviderStateMixin {
  late final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> messages = [];
  bool isBotTyping = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showJourneyDialog();
      _addBotMessage("Hi! How can I help you today?");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showJourneyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Begin your recycling",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  "journey!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
      });
    }
  } catch (e) {
    setState(() {
      messages.add({
        'sender': 'bot',
        'message': 'Oops! Something went wrong: $e',
      });
    });
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
  }

  void _addBotMessage(String text) {
    setState(() {
      messages.add({'sender': 'bot', 'message': text});
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 6,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 6,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 700),
              width: 6,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.smart_toy_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text("Green Loop Bot", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFB3D8A8),
      body: Stack(
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
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'assets/images/leaves_background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: messages.length + (isBotTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (isBotTyping && index == messages.length) {
                      return _buildTypingIndicator();
                    }


                    final message = messages[index];
                    final isUserMessage = message['sender'] == 'user';

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      alignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? const Color(0xFFA3D1C6)
                              : const Color(0xFFFBFFE4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft:
                                isUserMessage ? Radius.circular(16) : Radius.circular(4),
                            bottomRight:
                                isUserMessage ? Radius.circular(4) : Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF3D8D7A),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Message Green Loop Bot",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: _sendMessage,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
