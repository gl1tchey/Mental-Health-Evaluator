import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mentalapp/pages/login_page.dart';
import 'package:mentalapp/services/user_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isMale = true;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String fullNameError = '';
  String addressError = '';
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  void toggleGender(bool value) {
    setState(() {
      isMale = value;
    });
  }

  Future<void> register() async {
    setState(() {
      fullNameError = '';
      addressError = '';
      emailError = '';
      passwordError = '';
      confirmPasswordError = '';
    });

    String user_fullname = fullNameController.text.trim();
    String user_address = addressController.text.trim();
    String user_email = emailController.text.trim();
    String user_password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    bool isValid = true;

    if (user_fullname.isEmpty) {
      fullNameError = 'Full Name is required.';
      isValid = false;
    }

    if (user_address.isEmpty) {
      addressError = 'Address is required.';
      isValid = false;
    }

    if (user_email.isEmpty) {
      emailError = 'Email is required.';
      isValid = false;
    }

    if (user_password.isEmpty) {
      passwordError = 'Password is required.';
      isValid = false;
    } else if (user_password.length < 8) {
      passwordError = 'Password must be at least 8 characters.';
      isValid = false;
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Confirm Password is required.';
      isValid = false;
    } else if (user_password != confirmPassword) {
      confirmPasswordError = 'Passwords do not match.';
      isValid = false;
    }
      print('VALIDATING!!');
    if (isValid) {
       print('SAVING DATA TO DATABASE');
      try {
        var userService = UserService();
        await userService.insertUser(
            email: user_email,
            password: user_password,
            fullName: user_fullname,
            address: user_address,
            sex: isMale ? 'M' : 'F',
            score: 0,
          );
          print('Registration successful');
        } catch (e) {
        print('Registration failed: $e');
      }
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (fullNameError.isNotEmpty)
                    Text(
                      fullNameError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (addressError.isNotEmpty)
                    Text(
                      addressError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isMale ? const Color.fromARGB(255, 34, 34, 34) : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        onPressed: () {
                          toggleGender(true);
                        },
                        child: const Text(
                          'Male',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isMale ? Colors.grey : const Color.fromARGB(255, 34, 34, 34),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        onPressed: () {
                          toggleGender(false);
                        },
                        child: const Text(
                          'Female',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (emailError.isNotEmpty)
                    Text(
                      emailError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Create Password',
                      hintText: 'At least 8 digits',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (passwordError.isNotEmpty)
                    Text(
                      passwordError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (confirmPasswordError.isNotEmpty)
                    Text(
                      confirmPasswordError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 34, 34, 34)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 134, 134, 134)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
