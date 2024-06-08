import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/forgot.dart';
import 'package:breedex/view/Auth/register.dart';
import 'package:breedex/view/home/new_herd.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const CustomTextField(
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
                    onTap: (){
                      AppCustomNavigator.push(context,const ForgotScreen());
                    },
                    child: Text(
                      'Forget Password?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomButton(
                  text: 'Log in',
                  onTap: () {
                 AppCustomNavigator.push(context,NewHerd());
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
                    Container(
                      width: 30.w,
                      child: Image.asset(AppImages.facebook),
                    ),
                    Container(
                      width: 30.w,
                      child: Image.asset(AppImages.google),
                    ),
                    Container(
                      width: 30.w,
                      child: Image.asset(AppImages.apple),
                    ),
                  ],
                ),
                 SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: (){
                         AppCustomNavigator.push(context,RegisterScreen());
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
