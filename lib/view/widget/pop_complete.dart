import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';




class PopupDialogComplete {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.40, 
          child: AlertDialog(
            backgroundColor: AppColors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.cancel_outlined)),
                  SizedBox(
                      height: 12.h,
                      width: 12.w,
                      child: Image.asset(AppImages.check),
                    ),
              
                Text(
                  "Excellent 90+",
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
                  "Lorem Ipsum is simply dummy tex",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                SizedBox(
                  height: 2.h,
                ),
            
            ],
          ),
          )  );
      },
    );
  }
}
