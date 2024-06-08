import 'package:breedex/model/listitem_model.dart';
import 'package:breedex/view/home/Quiz/quiz2.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int selectedOption = -1;
  
  final List<ListItem> items = [
    ListItem(text: 'Chest: Adequete width and spacing between front legs', percentage: '13%'),
    ListItem(text: 'Heart Girth: Deep and with well sprung fore ribs blending into shoulders', percentage: '13%'),
    ListItem(text: 'Bone Mass: Strong without coarseness', percentage: '10%'),
    ListItem(text: 'Muzzle: Broad with large open nostrils and a strong jaw', percentage: '7%'),
    ListItem(text: 'Shoulder Blades and Elbows: Firmly set against the chest wall', percentage: '17%'),
    ListItem(text: 'Crops: Full', percentage: '15%'),
    ListItem(text: 'Size: The volumetric measurment of the capacity of the cow (LxWxH) is evaluated with age and breed recommendations taken into consdieration. Height at withers and hips should be realtively proportiate.', percentage: '25%'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
               AppCustomNavigator.pop(context);
              },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 67.w,
              child: CustomLinearProgressBar(maxSteps: 5, currentStep: 1),
            ),
            Text(
              "1/5",
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
                  'Tell us about yourself?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1-Strength & Substance',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '20%',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
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
                SizedBox(height: 2.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  item.text,
                                style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Text(
                                item.percentage,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                enableBorder: false,
                                name: 'Detail',
                                hintText: 'Enter the details, Must be 1-50 words',
                                fillColor: Colors.white,
                                maxLines: 3, 
                                minLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
               
                SizedBox(height: 2.h),
                Center(
                  child: Text(
                        'Your Score is: 96',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                ),
                      SizedBox(height: 4.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.replace(context, const Quiz2());
                  },
                ),
                SizedBox(height: 2.h),
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
                    border: Border.all(color: AppColors.green, width: 2,),
                  ),
                  child: const Icon(Icons.circle, color: AppColors.green),
                )
              : const Icon(Icons.radio_button_unchecked), 
          title: Text(
            optionText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
        ),
      ),
    );
  }
}
