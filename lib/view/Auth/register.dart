import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/view/Auth/forgot.dart';
import 'package:breedex/view/splash_screen.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  'Username',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(enableBorder: true,
                  name: 'username',
                  hintText: '@username',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(enableBorder: true,
                  name: 'email',
                  hintText: 'Your email',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                CustomTextField(enableBorder: true,
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
                  enableBorder: true,
                  name: 'Confirm Password',
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
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                    'Forget Password?',
                    style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPressed: (){
                      AppCustomNavigator.push(context, const ForgotScreen());
                    }
                  ),
                ),
                SizedBox(height: 3.h),
                CustomButton(
                  text: 'Register',
                  onTap: () {
                    AppCustomNavigator.replace(context, const SplashScreen());
                  },
                ),
                SizedBox(height: 3.h),
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
                    SizedBox(
                      width: 30.w,
                      child: Image.asset(AppImages.facebook),
                    ),
                    SizedBox(
                      width: 30.w,
                      child: Image.asset(AppImages.google),
                    ),
                    SizedBox(
                      width: 30.w,
                      child: Image.asset(AppImages.apple),
                    ),
                  ],
                ),
                 
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: (){
                        AppCustomNavigator.replace(context, const LoginScreen());
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
