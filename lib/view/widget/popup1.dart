
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/home/Quiz/quiz.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/pop_complete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopupDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.60, // Set height to 25% of the screen height
          child: AlertDialog(
            backgroundColor: AppColors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 10.w,
                      child: Image.asset(AppImages.check),
                    ),
                    Icon(Icons.cancel_outlined),
                  ],
                ),
                Text(
                  "Summary Page",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
                ),
              ],
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subcategory Total",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      "35",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Final Score",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      "35",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category Name",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      "Fight",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(text: "Edit",color: AppColors.grey,width: 32.w,onTap: () {
                      AppCustomNavigator.replace(context, Quiz());
                  },),
                  CustomButton(text: "Confirm",width: 32.w,onTap: () {
                    
                    PopupDialogComplete.show(context);
                  },),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
