import 'package:flutter/material.dart';
import 'package:mentalapp/pages/survey_page.dart';
import 'package:mentalapp/pages/register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
} 

class _LoginPageState extends State<LoginPage> {
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
              height: 100,
              width: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:100.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SurveyPage()),
                );
              },
              child: const Text(
                'Forgot Password?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: SizedBox(
                width: double.infinity, // Or a specific width
                height: 50, // Set desired height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SurveyPage()), // Replace with your target page
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: SizedBox(
              width: double.infinity, // Or a specific width
              height: 50, // Set desired height
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 34, 34, 34)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()), // Replace with your target page
                  );
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 134, 134, 134),
                  ),
                ),
              ),
            ),
          ),

            const SizedBox(height: 5),
            const Text(
              '',
              //'Incorrect username or passwowrd',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1.0)
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
