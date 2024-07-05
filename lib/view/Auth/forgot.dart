import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/provider/splash_provider.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/Auth/otp.dart';
import 'package:breedex/view/Auth/password_changed.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:breedex/provider/auth_provider.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Don’t worry! It happens. Please enter the email associated with your account.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: _emailController,
                  enableBorder: true,
                  name: 'email',
                  hintText: 'Your email',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Consumer<LoadingProvider>(
                  builder: (context, loadingProvider, child) {
                    return loadingProvider.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'Send Code',
                            onTap: () async {
                              final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
                              loadingProvider.setLoading(true);
                              final authProvider = Provider.of<AuthProvider>(context, listen: false);
                              await authProvider.sendPasswordResetEmail(context, _emailController.text);
                              loadingProvider.setLoading(false);
                              AppCustomNavigator.push(context, PasswordChange());
                            },
                          );
                  },
                ),
                SizedBox(height: 42.h),
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
                          text: 'Remember Password? ',
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
