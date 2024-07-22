import 'package:breedex/view/home.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/view/Auth/forgot.dart';
import 'package:breedex/view/Auth/register.dart';
import 'package:breedex/view/home/new_herd.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/auth_provider.dart';
import 'package:breedex/provider/splash_provider.dart';
import 'package:breedex/view/widget/custom_button.dart';
// ignore_for_file: use_build_context_synchronously


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  'Login ',
                  style: Theme.of(context).textTheme.displaySmall,
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
                  hintText: 'Password',
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
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      AppCustomNavigator.push(context, const ForgotScreen());
                    },
                    child: Text(
                      'Forget Password?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Consumer<LoadingProvider>(
                  builder: (context, loadingProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Log in',
                          onTap: () async {
                            final authProvider = Provider.of<AuthProvider>(context, listen: false);
                            final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
                            loadingProvider.setLoading(true);
                            try {
                              await authProvider.loginWithEmailAndPassword(
                                context, 
                                _emailController.text,
                                _passwordController.text,
                              );

                              if (authProvider.user != null) {
                                AppCustomNavigator.replace(context, const HomePage());
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login failed: $e')),
                              );
                            } finally {
                              loadingProvider.setLoading(false);
                            }
                          },
                        ),
                        SizedBox(height: 1.h,),
                        if (loadingProvider.isLoading)
                          const CircularProgressIndicator(),
                      ],
                    );
                  },
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.sp),
                      child: Text(
                        'Or Login with',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   width: 30.w,
                    //   child: Image.asset(AppImages.facebook),
                    // ),
                    SizedBox(
                      width: 30.w,
                      child: GestureDetector(
                        onTap: () async {
                          final authProvider = Provider.of<AuthProvider>(context, listen: false);
                          final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
                          loadingProvider.setLoading(true);
                          try {
                            await authProvider.signInWithGoogle(context);
                            if (authProvider.user != null) {
                              AppCustomNavigator.replace(context, const NewHerd());
                            }
                          } finally {
                            loadingProvider.setLoading(false);
                          }
                        },
                        child: Image.asset(AppImages.google),
                      ),
                    ),
                    // Container(
                    //   width: 30.w,
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       final authProvider = Provider.of<AuthProvider>(context, listen: false);
                    //       final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
                    //       loadingProvider.setLoading(true);
                    //       try {
                    //         await authProvider.signInWithApple(context);
                    //         if (authProvider.user != null) {
                    //           AppCustomNavigator.replace(context, NewHerd());
                    //         }
                    //       } finally {
                    //         loadingProvider.setLoading(false);
                    //       }
                    //     },
                    //     child: Image.asset(AppImages.apple),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: () {
                        AppCustomNavigator.push(context, const RegisterScreen());
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Register Now',
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
