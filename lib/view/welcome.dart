import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/images.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.horn),
                fit: BoxFit.fill,
              ),
            ),
          ),
           Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [
                Text(
                  "Breeders of Excellence",
               style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                        color: AppColors.black,
                        ),
                ),
                Text(
                  "Where quality speaks for itself",
                 style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        color: AppColors.black,
                        ),
                ),
                 SizedBox(height: 1.h,),
                CustomButton(text: "Get Started",
                borderRadius: BorderRadius.circular(25),
                width: 50.w,
                height: 5.5.h,
                onTap: (){
AppCustomNavigator.replace(context , LoginScreen());
                }
               
                ),
             SizedBox(height: 3.h,),
              ],
                       ),
           ),
        ],
      ),
    );
  }
}
