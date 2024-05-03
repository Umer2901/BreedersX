import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/Auth/reset_password.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool obsecurePassword = true;
  String otp = '';
  
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
                Text(
                  'Please check your email',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text.rich(
                  TextSpan(
                    text: 'We’ve sent a code to',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    children: <InlineSpan>[
                      TextSpan(
                        text: ' helloworld@gmail.com',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                
               Padding(
                 padding:  EdgeInsets.all(5.sp),
                 child: SizedBox(
                  height: 8.h,
                               
                   child: PinInputTextField(
                   
                      pinLength: 4,
                      decoration: BoxLooseDecoration(
                        strokeWidth: 0,
                        strokeColorBuilder: PinListenColorBuilder(
                          AppColors.grey, 
                          AppColors.black, 
                        ),
                      ),
                      
                    
                      onSubmit: (String pin) {
                        setState(() {
                          otp = pin;
                        });
                      },
                    ),
                 ),
               ),
                SizedBox(height: 3.h),
                CustomButton(
                  text: 'Verify',
                  onTap: () {
                   
                    AppCustomNavigator.push(context, ResetPassword());
                  },
                ),
                SizedBox(height: 42.h),
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
                          text: 'Send code again ',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '00:20',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(),
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
