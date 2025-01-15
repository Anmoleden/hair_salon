import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../components/social_login_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.cyan],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/hairstyle.png', // Ensure this asset exists
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Heading Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Discover the Trendy Hairstyle',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            // Description Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Explore all the latest hairstyles that suit you with just a few clicks.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            // Login Button
            ElevatedButton(
              onPressed: () => _showLoginOptions(context),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show login options dialog
  void _showLoginOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Login Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Google Login Button
              SocialLoginButton(
                label: 'Login with Google',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                icon: Icons.email,
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToHomeScreen(context, 'Google');
                },
              ),
              const SizedBox(height: 10),
              // Facebook Login Button
              SocialLoginButton(
                label: 'Login with Facebook',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                icon: Icons.facebook,
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToHomeScreen(context, 'Facebook');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to navigate to the home screen
  void _navigateToHomeScreen(BuildContext context, String method) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(loginMethod: method),
      ),
    );
  }
}
