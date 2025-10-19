// import 'package:ebusiness/services/auth_services.dart';
import 'package:ebusiness/widgets/custom_button.dart';
import 'package:ebusiness/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create Account 🧾',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _nameController,
                  labelText: "Full Name",
                  icon: Icons.person,
                ),
                CustomTextField(
                  controller: _phoneController,
                  labelText: "Phone",
                  icon: Icons.phone,
                ),
                CustomTextField(
                  controller: _addressController,
                  labelText: "Address",
                  icon: Icons.home,
                ),
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  icon: Icons.email,
                ),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Register",
                  textColor: Colors.white,
                  onPressed: () {
                    // AuthService().registerUser(
                    //   context,
                    //   _nameController.text,
                    //   _phoneController.text,
                    //   _addressController.text,
                    //   _emailController.text,
                    //   _passwordController.text,
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
