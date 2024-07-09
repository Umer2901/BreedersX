import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/widget/popup1.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';






class Quiz5 extends StatefulWidget {
  const Quiz5({super.key});

  @override
  State<Quiz5> createState() => _Quiz5State();
}

class _Quiz5State extends State<Quiz5> {
  int selectedOption = -1;
 final List<ListItem> items = [
    ListItem(text: 'Udder Depth: Moderate depth relative to hock with adequate capacity and clearance. Consideration is given to lactation number and age', percentage: '20%'),
    ListItem(text: 'Fore Udder: Firmly attached with moderate length and ample capacity', percentage: '15%'),
    ListItem(text: 'Rear Udder: Wide and high, firmly attached with a unifrom width top to bottom and fullness at base of the rear udder where it turns to become the udder floor', percentage: '15%'),
    ListItem(text: 'Teat Placement: squarely placed under each quarter, plumb and properly spaced from side and rear views', percentage: '15%'),
    ListItem(text: 'Teats: Cyclindrical shape and uniform size with medium length and diameter', percentage: '15%'),
    ListItem(text: 'Udder Cleft: Evidence of strong median suspensory liagment indicated by adequately definined halving ', percentage: '10%'),
    ListItem(text: 'Udder Balance and Texture: Should exhibit an udder floor that is level as viewed from side. Quarters should be evenly balanced, soft pliable and well collapsed after milking', percentage: '10%'),
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 5),
            ),
            Text(
              "5/5",
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
                  'Physical activity level?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     '5-Mammary System',
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
               SizedBox(height: 2.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    PopupDialog.show(context);
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
