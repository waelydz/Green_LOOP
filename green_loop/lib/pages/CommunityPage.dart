import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  List<Map<String, dynamic>> posts = [
    {
      'user': '@Manar_AT',
      'text':
          "Hello Green Loopers! I hope you all are having a great day, just wanted to share a little something today. After having all of my children grow up and leave their toys behind, I became overwhelmed by the amount of toys that it seemed discouraging for me to just throw them away.. So I decided to ask Green Loop Bot to help me upcycle their old soccer balls, and TADA! I was able to turn them into small vases for my plants in my yard.",
      'image': 'assets/images/news1.jpg',
      'likes': 347,
      'comments': 7,
      'replies': [
        {
          'user': '@ElegantSarah',
          'text': "Clever idea! I have my kids’ inflated footballs lying around.",
          'count': 4
        },
        {
          'user': '@SpectacularShahd',
          'text': "That looks totally cool! Brilliant even.",
          'count': 3
        },
        {
          'user': '@CuriousYasmeen',
          'text': "Oh by the way, I didn’t know such footballs existed, I might have to try up-cycling them.",
          'count': 8
        },
        {
          'user': '@SpontaneousAhmed',
          'text': "Man it’s sad to see those balls being inflated! But I will admit, this is such a clever usage for them.",
          'count': 16
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D8A8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        title: const Text(
          'Community Hub',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPostBox(),
          const SizedBox(height: 20),
          ...posts.map((post) => _buildPostCard(post)).toList(),
        ],
      ),
    );
  }

  Widget _buildPostBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.8),
      ),
      child: Column(
        children: [
          TextField(
            controller: _postController,
            maxLines: 4,
            maxLength: 440,
            decoration: InputDecoration.collapsed(
              hintText: 'Share something...',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.image),
              SizedBox(width: 10),
              Text("GIF"),
              SizedBox(width: 10),
              Icon(Icons.videocam),
              Spacer(),
              Text("0/440"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.95),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post['image'] != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(post['image']),
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
              ),
              const SizedBox(width: 10),
              Text(post['user'], style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(post['text']),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.mode_comment_outlined, size: 20),
              const SizedBox(width: 8),
              Icon(Icons.favorite_border, size: 20),
              const SizedBox(width: 4),
              Text("${post['likes']}"),
              const SizedBox(width: 16),
              Icon(Icons.reply, size: 20),
              const SizedBox(width: 4),
              Text("${post['comments']}"),
            ],
          ),
          const Divider(height: 20),
          _buildReplyField(),
          ...post['replies'].map<Widget>((reply) => _buildReply(reply)).toList()
        ],
      ),
    );
  }

  Widget _buildReplyField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _replyController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Post a reply...',
        ),
      ),
    );
  }

  Widget _buildReply(Map<String, dynamic> reply) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 16, backgroundColor: Colors.teal),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reply['user'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(reply['text']),
                Text("View Replies (${reply['count']})", style: TextStyle(color: Colors.teal)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
