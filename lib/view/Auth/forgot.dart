import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/otp.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
            child: const Icon(Icons.arrow_back),
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
                const CustomTextField(
                  enableBorder: true,
                  name: 'email',
                  hintText: 'Your email',
                  fillColor: AppColors.white,
                ),
               
                SizedBox(height: 3.h),
              
                CustomButton(
                  text: 'Send Code',
                  onTap: () {
                    AppCustomNavigator.push(context, const OtpScreen());
                  },
                ),
                
                 SizedBox(height: 42.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: GestureDetector(
                      onTap: (){
                         AppCustomNavigator.replace(context,const LoginScreen());
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
