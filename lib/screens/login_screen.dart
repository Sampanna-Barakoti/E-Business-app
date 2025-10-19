// import 'package:ebusiness/services/auth_services.dart';
import 'package:ebusiness/screens/home_page.dart';
import 'package:ebusiness/widgets/custom_button.dart';
import 'package:ebusiness/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Login Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                    // AuthService().loginWithEmail(
                    //   context,
                    //   _emailController.text,
                    //   _passwordController.text,
                    // );
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Login with Google",
                  textColor: const Color.fromARGB(255, 0, 106, 255),
                  color: Colors.white,
                  borderColor: const Color.fromARGB(255, 0, 106, 255),
                  icon: Image.network(
                    'https://developers.google.com/identity/images/g-logo.png',
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () {
                    // AuthService().signInWithGoogle(context);
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
