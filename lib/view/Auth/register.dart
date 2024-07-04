import 'package:breedex/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/forgot.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/splash_screen.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Register to get started',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                CustomTextField(
                  controller: _emailController,
                  enableBorder: true,
                  name: 'email',
                  hintText: 'Your email',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                CustomTextField(
                  controller: _passwordController,
                  enableBorder: true,
                  name: 'password',
                  hintText: '*******',
                  obscureText: obsecurePassword,
                  fillColor: AppColors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obsecurePassword = !obsecurePassword;
                      });
                    },
                    child: Icon(
                      obsecurePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Confirm Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  enableBorder: true,
                  name: 'confirm_password',
                  hintText: '******',
                  obscureText: obsecurePassword,
                  fillColor: AppColors.white,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obsecurePassword = !obsecurePassword;
                      });
                    },
                    child: Icon(
                      obsecurePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomButton(
                  text: 'Register',
                  onTap: () async {
                    if (_passwordController.text != _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }

                    final authProvider = Provider.of<AuthProvider>(context, listen: false);
                    try {
                      await authProvider.registerWithEmailAndPassword(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (authProvider.user != null) {
                        AppCustomNavigator.replace(context, SplashScreen());
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registration failed: $e')),
                      );
                    }
                  },
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: () {
                        AppCustomNavigator.replace(context, LoginScreen());
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Login Now',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
