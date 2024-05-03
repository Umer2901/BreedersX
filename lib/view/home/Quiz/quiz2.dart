import 'package:breedex/view/home/Quiz/quiz3.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key});

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  int selectedOption = -1;

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
            child: const Icon(Icons.arrow_back),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 67.w,
              child: CustomLinearProgressBar(maxSteps: 5, currentStep: 2),
            ),
            Text(
              "2/5",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
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
                Text(
                  'How old are you?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 3.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.grey,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      buildOption('Lorem Ipsum is simply dummy text of the printing', 0),
                      buildOption('Lorem Ipsum is simply dummy text of the printing', 1),
                      buildOption('Lorem Ipsum is simply dummy text of the printing', 2),
                      buildOption('Lorem Ipsum is simply dummy text of the printing', 3),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.replace(context, const Quiz3());
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

  Widget buildOption(String optionText, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey,
              width: 1,
            ),
          ),
        
        ),
        child: ListTile(
          leading: selectedOption == index
              ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.green,
                      width: 2,)
                ),
                child: const Icon(Icons.circle, color: AppColors.green))
              : const Icon(Icons.radio_button_unchecked), 
          title: Text(
            optionText,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          
         ),
          
          ),
        ),
      ),
    );
  }
}
