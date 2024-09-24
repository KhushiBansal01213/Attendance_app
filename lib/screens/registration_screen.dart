import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add Get package for navigation
import 'package:attendance_app/services/auth_services.dart';
import 'package:attendance_app/screens/menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_app/utils/constants.dart'; // Import the constant file

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    User? user = await _authService.signUp(
        _emailController.text, _passwordController.text);

    if (user != null) {
      // Update the user's profile with the display name
      await user.updateProfile(displayName: _nameController.text);
      await user.reload(); // Reload the user to get the updated data
      user = FirebaseAuth.instance.currentUser; // Get the updated user

      // Navigate to menu screen after successful registration
      Get.offAll(MenuScreen());
    } else {
      // Show error message
      Get.snackbar(
        "Registration Failed",
        "Please try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      print("Registration failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Register Supervisor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.containerBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create an Account',
                        style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Name Field
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(color: AppColors.hintTextColor),
                        labelStyle: TextStyle(color: AppColors.textColor),
                      ),
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    SizedBox(height: 10),
                    // Organization Field
                    TextField(
                      controller: _organizationController,
                      decoration: InputDecoration(
                        labelText: 'Organization Name',
                        hintText: 'Enter your organization name',
                        hintStyle: TextStyle(color: AppColors.hintTextColor),
                        labelStyle: TextStyle(color: AppColors.textColor),
                      ),
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    SizedBox(height: 10),
                    // Email Field
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: AppColors.hintTextColor),
                        labelStyle: TextStyle(color: AppColors.textColor),
                      ),
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    SizedBox(height: 10),
                    // Password Field
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: AppColors.hintTextColor),
                        labelStyle: TextStyle(color: AppColors.textColor),
                      ),
                      obscureText: true,
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _register,
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back(); // Navigate back to the login screen
                      },
                      child: Text(
                        'Already have an account? Login here!',
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
