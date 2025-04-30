import 'package:flutter/material.dart';

class SupportCenterPage extends StatefulWidget {
  @override
  State<SupportCenterPage> createState() => _SupportCenterPageState();
}

class _SupportCenterPageState extends State<SupportCenterPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': "Hi! I'm Sarah from Green Loop. How can I help you today?", 'fromAgent': true},
  ];
  bool _typing = false;

  List<String> faqs = [
    "Refund request",
    "Mini-game points issue",
    "Chat problem",
    "Delete my account"
  ];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({'text': message.trim(), 'fromAgent': false});
      _controller.clear();
      _typing = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _typing = false;
        _messages.add({
          'text': "Thank you. We'll escalate your concern to our dedicated team.",
          'fromAgent': true
        });
      });
    });
  }

  Widget _buildMessage(String text, bool fromAgent) {
    return Align(
      alignment: fromAgent ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: fromAgent ? const Color(0xFFBFE5D4) : const Color(0xFFFBFFE4),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: fromAgent ? Radius.zero : const Radius.circular(18),
            bottomRight: fromAgent ? const Radius.circular(18) : Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Text(text, style: const TextStyle(fontSize: 14.5)),
      ),
    );
  }

  Widget _typingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFDCEFE4),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dot(),
            const SizedBox(width: 4),
            _dot(delay: 200),
            const SizedBox(width: 4),
            _dot(delay: 400),
          ],
        ),
      ),
    );
  }

  Widget _dot({int delay = 0}) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.3, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, _) => Opacity(
        opacity: value,
        child: const CircleAvatar(radius: 3.5, backgroundColor: Colors.green),
      ),
      onEnd: () => setState(() {}),
    );
  }

  Widget _faqQuickReplies() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: faqs.map((faq) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: OutlinedButton(
              onPressed: () => _sendMessage(faq),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF3D8D7A)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(faq, style: const TextStyle(color: Color(0xFF3D8D7A))),
            ),
          );
        }).toList(),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.support_agent, size: 30, color: Colors.black),
            SizedBox(height: 4),
            Text("Support Center", style: TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _faqQuickReplies(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _messages.length + (_typing ? 1 : 0),
              itemBuilder: (context, index) {
                if (_typing && index == _messages.length) {
                  return _typingIndicator();
                }
                final msg = _messages[index];
                return _buildMessage(msg['text'], msg['fromAgent']);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF3D8D7A),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
