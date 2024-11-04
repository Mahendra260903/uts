import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tiktok/utils/auth_service.dart';
import 'package:tiktok/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.saveToken(password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and password cannot be empty")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Log in",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF121212),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF121212),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF121212),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ElevatedButton(
          onPressed: () => _login(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.tiktokRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Text(
            "Login",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(46.0),
        child: Column(
          children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
              width: 300,
            ),
            TextField(
              controller: _emailController,
              cursorColor: AppColors.tiktokRed,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text(
                  "Email or username",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              cursorColor: Colors.red,
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _obscurePassword = !_obscurePassword;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
