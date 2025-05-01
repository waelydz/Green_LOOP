import 'package:flutter/material.dart';

class ReportProblemPage extends StatefulWidget {
  @override
  _ReportProblemPageState createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage>
    with SingleTickerProviderStateMixin {
  bool _agreeToEmail = false;
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.9,
      upperBound: 1.0,
    );
    _buttonAnimation =
        CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    await _buttonController.forward();
    await _buttonController.reverse();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFB3D8A8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Thank you for reporting the problem!\nOur team will contact you if needed.',
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB3D8A8),
              Color(0xFFAFD7CC),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Report a Problem",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "From: mtalib@sharjah.ac.ae",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Facing a Problem? We’d love to solve it.\nBut please don't share sensitive information. "
                  "Have questions or concerns? Try contacting Support Center.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 61, 61, 61),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xFF3D8D7A),
                      value: _agreeToEmail,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToEmail = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "We may email you for more information or updates.",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: ScaleTransition(
                    scale: _buttonAnimation,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D8D7A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 14),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
