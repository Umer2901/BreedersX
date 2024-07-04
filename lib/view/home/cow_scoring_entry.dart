import 'package:breedex/view/home/Quiz/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/Auth/register.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/navigator.dart';
import 'package:sizer/sizer.dart';

class CowScoring extends StatefulWidget {
  const CowScoring({Key? key}) : super(key: key);

  @override
  State<CowScoring> createState() => _CowScoringState();
}

class _CowScoringState extends State<CowScoring> {
  int selectedIndex = 0;

  List<String> options = ["Milk production", "Body condition", "Reproduction metrics"]; 

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
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          'Cow Scoring Entry',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 3.h),
                Text(
                  'Cow Name',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Cow Name',
                  hintText: 'Cow Name',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Text(
                  'Date of Birth',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Date of Birth',
                  hintText: 'Date of Birth',
                  fillColor: AppColors.white,
                  suffixIcon: Icon(Icons.calendar_month, color: AppColors.primary),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Dam',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Dam',
                  hintText: 'Dam',
                  fillColor: AppColors.white,
                ),
                  SizedBox(height: 3.h),
                Text(
                  'Sire',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Sire',
                  hintText: 'Sire',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                Text(
                  '# of Times Calved',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Time calved ',
                  hintText: '12',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scoring Entry',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
               SizedBox(height: 4.h),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(options.length, (index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index; 
          });
        },
        child: Container(
          //width: 50,
         height: 35.sp,
          margin: EdgeInsets.symmetric(horizontal: 3.sp) ,
          decoration: BoxDecoration(
            color: index == selectedIndex ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(25), 
            border: Border.all(
              color: AppColors.black, 
              width: 1, 
            ),
          ),
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(8.sp),
              child: Text(
                options[index],
                style: TextStyle(
                  color: index == selectedIndex ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }),
  ),
),

                SizedBox(height: 4.h),
                CustomButton(
                  text: 'Submit',
                  onTap: () {
                    AppCustomNavigator.push(context, Quiz());
                  },
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
