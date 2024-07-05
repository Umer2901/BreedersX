import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/listitem_model.dart';
import 'package:breedex/view/home/Quiz/quiz4.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';





class Quiz3 extends StatefulWidget {
  const Quiz3({super.key});

  @override
  State<Quiz3> createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  int selectedOption = -1;
  
  final List<ListItem> items = [
    ListItem(text: 'Rump: Tail head is set slightly above and neatly between pin bones, and the tail is free from coarseness', percentage: '22%'),
    ListItem(text: 'Rump: Pins should be adequately spaced and slightly lower (2 inches) then hip bones; rump should be long with thurls of proportionate width.', percentage: '26%'),
    ListItem(text: 'Vulva: Is nearly vertical and the anus should not be recessed', percentage: '26%'),
    ListItem(text: 'Back: Should be straight and strong; the loin-broad, strong, and nearly level', percentage: '26%'),
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 3),
            ),
            Text(
              "3/5",
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
                  'What is your weight?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3-Rump',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '15%',
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
                          const SizedBox(height: 8),
                          Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            width: double.infinity,
                            child: const Padding(
                              padding:  EdgeInsets.all(8.0),
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
                SizedBox(height: 4.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.replace(context, const Quiz4());
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
