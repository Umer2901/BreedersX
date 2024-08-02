
import 'package:breedex/view/home.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';

class PopupDialogComplete {
  static void show(BuildContext context, int finalScore) {
    String message = getMessageForScore(finalScore);

    showDialog(
      barrierDismissible: false,
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
                GestureDetector(
                  onTap: () {
                    AppCustomNavigator.replace(context, const HomePage());
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.cancel_outlined),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                  width: 12.w,
                  child: Image.asset(AppImages.check),
                ),
                Text(
                  message,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
                ),
              ],
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                // Text(
                //   "Lorem Ipsum is simply dummy text.",
                //   style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                // ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static String getMessageForScore(int score) {
    if (score >= 90) {
      return "Excellent $score";
    } else if (score >= 85) {
      return "Very Good $score";
    } else if (score >= 80) {
      return "Good Plus $score";
    } else if (score >= 75) {
      return "Good $score";
    } else if (score >= 70) {
      return "Fair $score";
    } else if (score >= 65) {
      return "Poor $score";
    } else {
      return "Below Threshold $score";
    }
  }
}
