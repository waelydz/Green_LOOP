import 'package:flutter/material.dart';

//to be added: make sure the user has inputted text in the text field before they press submit and are moved to the next page
//to be added: make sure the email and password inputs are in the valid format ex: smth@org.com etc.


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  Color c1 = const Color(0xFF3D8D7A);
  Color c2 = const Color(0xFFB3D8A8);
  Color c3 = const Color(0xFFA3D1C6);
  Color c4 = const Color(0xFFFBFFE4);

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: c1,
        appBar: AppBar(
        backgroundColor: c1, 
        elevation: 0, 
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); 
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Image.asset(
              'assets/images/backicon1.png', 
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //greenloop logo
          SizedBox(
            width: 250,
            height: 250,
            child: Image.asset('assets/images/Green_LOOP.png'),
          ),

          SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email or Phone Number",
                  filled: true,
                  fillColor: c4, // Background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Password Input
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: _isObscure, // Toggles password visibility
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  filled: true,
                  fillColor: c4, // Background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure; // Toggle state
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
            width:130,
            child:ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: c2, // Button color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text("Submit"),
          ),),
          const SizedBox(height: 20),

        ])));
  }
}
