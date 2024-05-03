import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/Auth/otp.dart';
import 'package:breedex/view/Auth/password_changed.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obsecurePassword = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(50,),
            ),
            child: Icon(Icons.arrow_back),
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
             //   SizedBox(height: .h),
                Text(
                  'Reset password',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Please type something you’ll remember',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 4.h),
                Text(
                  'New password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                  SizedBox(height: 1.h),
                CustomTextField(
                  name: 'New password',
                  hintText: 'New password',
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
                SizedBox(height: 2.h),
                Text(
                  'Confirm New password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                  SizedBox(height: 1.h),
              CustomTextField(
                  name: 'New password',
                  hintText: 'Confirm New password',
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
                SizedBox(height: 4.h),
              
                CustomButton(
                  text: 'Reset password',
                  onTap: () {
                    AppCustomNavigator.push(context, PasswordChange());
                  },
                ),
                
                 SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: (){
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
