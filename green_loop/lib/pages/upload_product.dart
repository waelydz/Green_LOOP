import 'package:flutter/material.dart';

class UploadProductPage extends StatelessWidget {
  const UploadProductPage({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upload title button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAFCCF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: const [
                  Icon(Icons.add, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Main form container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFFE4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  children: [
                    const Text(
                      'Picture Preview',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    // Two stacked preview images
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/flower.jpg',
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/flower.jpg',
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 20),
                    _buildInputField('Enter Name'),
                    const SizedBox(height: 10),
                    _buildInputField('Add description', maxLines: 3),
                    const SizedBox(height: 10),
                    _buildInputField('Enter Material'),
                    const SizedBox(height: 10),
                    _buildInputField('Enter Price in AED'),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7AC4B2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
