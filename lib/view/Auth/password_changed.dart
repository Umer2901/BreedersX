import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/view/widget/custom_button.dart';




class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});


  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
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
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
               
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 50.w,
                    child: Image.asset(AppImages.logo)),
                  Text(
                    'Password Changed',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    'We send you a mail on your email.By using this you can change the password',
                    style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h),
                 
                
                  CustomButton(
                    text: 'Back to Login',
                    onTap: () {
                      AppCustomNavigator.replace(context, const LoginScreen());
                    },
                  ),
                  
                
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
