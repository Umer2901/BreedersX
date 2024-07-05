import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';



class NewHerd extends StatefulWidget {
  const NewHerd({super.key});

  @override
  State<NewHerd> createState() => _NewHerdState();
}

class _NewHerdState extends State<NewHerd> {
  
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
            child: const Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
                  '         Start New Herd',
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
                  'Ranch Name',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Your Name',
                  hintText: 'Your Name',
                  fillColor: AppColors.white,
                ),
                SizedBox(height: 3.h),
                 Text(
                  'Location',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Location',
                  hintText: 'Your Location',
                  fillColor: AppColors.white,
                  suffixIcon: Icon(Icons.arrow_downward,color: AppColors.primary,),
                ),
                SizedBox(height: 3.h),
                 Text(
                  'Total Head Scored',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const CustomTextField(
                  enableBorder: true,
                  name: 'Total Head',
                  hintText: '12',
                  fillColor: AppColors.white,
                  //suffixIcon: Icon(Icons.arrow_downward,color: AppColors.primary,),
                ),
               
            
             
                SizedBox(height: 4.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    AppCustomNavigator.push(context,CowScoring());
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
