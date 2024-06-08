import 'package:breedex/model/listitem_model.dart';
import 'package:breedex/view/home/Quiz/quiz3.dart';
import 'package:breedex/view/home/Quiz/quiz5.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Quiz4 extends StatefulWidget {
  const Quiz4({Key? key});

  @override
  State<Quiz4> createState() => _Quiz4State();
}

class _Quiz4State extends State<Quiz4> {
  int selectedOption = -1;
 final List<ListItem> items = [
    ListItem(text: 'Movement: Free and comfortable; able to rise and lie down easy', percentage: '35%'),
    ListItem(text: 'Feet: Steep angle and deep heel with short, well rounded, closed toes', percentage: '20%'),
    ListItem(text: 'Legs: Front and Rear: Tracking straight, wide apart with feet squarely placed. Hocks: Cleanly molded, free from coarseness and puffiness with adequate flexibility.', percentage: '10%'),
    ListItem(text: 'Rear legs - Side View: A moderate set (angle) to the hock.', percentage: '10%'),
    ListItem(text: 'Thurl Position: Centrally placed between hip bones and pin bones', percentage: '15%'),
    ListItem(text: 'Pasterns: Short, strong, flexible', percentage: '10%'),
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
              child: CustomLinearProgressBar(maxSteps: 5, currentStep: 4),
            ),
            Text(
              "4/5",
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
                  'What are your goals?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     '4-Mobility ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '20%',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
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
                SizedBox(height: 4.h),
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
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                        'Your Score is: 97',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                ),
               SizedBox(height: 2.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.replace(context, const Quiz5());
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
