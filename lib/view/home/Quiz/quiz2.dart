import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import '../../widget/custom_button.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/home/Quiz/quiz3.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';






class Quiz2 extends StatefulWidget {
  const Quiz2({super.key});

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  int selectedOption = -1;
 final List<ListItem> items = [
    ListItem(text: 'Ribs: Well sprung - not slab sided', percentage: '10%'),
    ListItem(text: 'Disposition: Calm, easy demeanor', percentage: '15%'),
    ListItem(text: 'Body Condition: Appropriate for the stage of lactation/environment', percentage: '10%'),
    ListItem(text: 'Breed Characteristics: Overall style, strength, and balance. Head should be feminine', percentage: '10%'),
    ListItem(text: 'Poll: Flat and upward V-shape', percentage: '20%'),
    ListItem(text: 'Brisket: Clean & free of excess fleshiness', percentage: '10%'),
    ListItem(text: 'Horns: Adequete length. Horn base tied in smoothly. No bulbous base or ballooned.', percentage: '10%'),
    ListItem(text: 'Tail: Long and slender', percentage: '5%'),
    ListItem(text: 'Underline: Trim-free of extra skin', percentage: '5%'),
    ListItem(text: 'Ears: Rounded help up tight to horn', percentage: '5%'),
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 2),
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
                SizedBox(height: 2.h),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     '2-Breed Characteristics',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '25%',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
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
                        'Your Score is: 96',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                ),
               SizedBox(height: 2.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.push(context, const Quiz3());
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
