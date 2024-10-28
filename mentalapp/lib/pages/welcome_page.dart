import 'package:flutter/material.dart';
import 'package:mentalapp/pages/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/icons/logo.png',
              height: 80,
            ),
            const SizedBox(height: 50),
            const Text(
              'Your Journey to Wellness Starts Here',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Explore our resources and tools to help you achieve \nyour wellness goals.',
              textAlign: TextAlign.left, 
              style: TextStyle(
                color: Colors.grey, 
                fontSize: 16, 
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(20),
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const LoginPage())
                  );
                },
                child: const Text(
                  "Get Started Now",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
