import 'package:flutter/material.dart';
import 'chat_page.dart'; // Import the ChatPage

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

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
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Product Card
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFBFFE4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product['image'],
                      height: 500,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    product['title'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(product['subtitle'],
                      style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(product['price'], style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 10),
                  Text(
                    product['description'],
                    style: const TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Buttons Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFFE4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  _buildActionButton("Add to Cart", context),
                  const SizedBox(height: 16),
                  _buildActionButton("Contact Seller", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (label == "Contact Seller") {
            // Navigate to the ChatPage when "Contact Seller" is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPage()), // Fixed the issue here by removing 'const'
            );
          } else if (label == "Add to Cart") {
            // You can add your cart logic here if needed in the future
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D8D7A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
