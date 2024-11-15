import 'package:breedex/provider/quize1_provider.dart';
import 'package:breedex/provider/quize2_provider.dart';
import 'package:breedex/provider/quize3_provider.dart';
import 'package:breedex/provider/quize4_provider.dart';
import 'package:breedex/provider/quize5_provider.dart';
import 'package:breedex/view/home.dart';
import 'package:breedex/view/home/Quiz/quiz2.dart';
import 'package:breedex/view/home/Quiz/quiz3.dart';
import 'package:breedex/view/home/Quiz/quiz4.dart';
import 'package:breedex/view/home/Quiz/quiz5.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:breedex/view/home/Quiz/quiz.dart';
import 'package:breedex/view/widget/pop_complete.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/model/scoring_entery_model.dart';

class PopupDialog {
  static void show(BuildContext context, String cowId) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('Cow Scoring').doc(cowId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Failed to load data."),
                actions: [
                  CustomButton(
                    text: "Close",
                    onTap: () {
                     AppCustomNavigator.replace(context, const HomePage());
                    },
                  ),
                ],
              );
            }

            final data = snapshot.data?.data() as Map<String, dynamic>?;
            final quiz1Score = data?['quiz1Score'] != null ? double.parse(data!['quiz1Score']) : 0;
            final quiz2Score = data?['quiz2Score'] != null ? double.parse(data!['quiz2Score']) : 0;
            final quiz3Score = data?['quiz3Score'] != null ? double.parse(data!['quiz3Score']) : 0;
            final quiz4Score = data?['quiz4Score'] != null ? double.parse(data!['quiz4Score']) : 0;
            final quiz5Score = data?['quiz5Score'] != null ? double.parse(data!['quiz5Score']) : 0;
            final finalScore = (quiz1Score * 0.2 + quiz2Score * 0.25 + quiz3Score * 0.15 + quiz4Score * 0.20 + quiz5Score * 0.20).toStringAsFixed(1);
            final scoringEntryId = data?['id'] as String?;

            if (scoringEntryId == null) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Scoring entry ID not found."),
                actions: [
                  CustomButton(
                    text: "Close",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }

            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('Cow Scoring').doc(scoringEntryId).get(),
              builder: (context, scoringEntrySnapshot) {
                if (scoringEntrySnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (scoringEntrySnapshot.hasError || !scoringEntrySnapshot.hasData) {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: const Text("Failed to load scoring entry data."),
                    actions: [
                      CustomButton(
                        text: "Close",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }

                final scoringEntryData = scoringEntrySnapshot.data?.data() as Map<String, dynamic>?;
                final scoringEntry = ScoringEntry.fromMap(scoringEntryData!);
                FirebaseFirestore.instance.collection('Cow Scoring').doc(cowId).update({
                  'finalScore': finalScore,
                }).then((_) {
                  print("Final score updated successfully");
                }).catchError((error) {
                  print("Failed to update final score: $error");
                });

                
                final finalScoreInt = (double.tryParse(finalScore) ?? 0).toInt();

                return FractionallySizedBox(
                  heightFactor: 0.60,
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
                            IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Text(
                          "Summary Page",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
                        ),
                      ],
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Category Name: ",
                          //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         scoringEntry.scoringEntry,
                          //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          //         overflow: TextOverflow.ellipsis,
                          //         softWrap: true,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                       //   SizedBox(height: 2.h),
                        
                           Container(
                            width: double.infinity,
                             child: ExpansionTile(
                              trailing: SizedBox.shrink(),
                              tilePadding: EdgeInsets.zero, 
                             childrenPadding: EdgeInsets.zero, 
                              title:   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Subcategory Total:",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                    ),
                                      Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                             //    Icon(Icons.edit)
                       
                              ],
                                                       ),
                              children: [
                                
                                GestureDetector(
                                  onTap: (){
                                    AppCustomNavigator.replace(context, Quiz(isComplete: true));
                                    Provider.of<Quiz1Provider>(context, listen: false).clearData();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Strength & Substance",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Text(
                                        quiz1Score.toStringAsFixed(1),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                       Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                                  GestureDetector(
                                  onTap: (){
                                    AppCustomNavigator.replace(context, Quiz2(isComplete: true));
                                    Provider.of<Quiz2Provider>(context, listen: false).clearData();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Breed Characteristics ",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Text(
                                        quiz2Score.toStringAsFixed(1),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                       Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                                  GestureDetector(
                                  onTap: (){
                                    AppCustomNavigator.replace(context, Quiz3(isComplete: true));
                                    Provider.of<Quiz3Provider>(context, listen: false).clearData();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rump",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Text(
                                        quiz3Score.toStringAsFixed(1),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                       Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                                  GestureDetector(
                                  onTap: (){
                                    AppCustomNavigator.replace(context, Quiz4(isComplete: true));
                                    Provider.of<Quiz4Provider>(context, listen: false).clearData();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mobility ",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Text(
                                        quiz4Score.toStringAsFixed(1),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                       Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                                  GestureDetector(
                                  onTap: (){
                                    AppCustomNavigator.replace(context, Quiz5(isComplete: true));
                                    Provider.of<Quiz5Provider>(context, listen: false).clearData();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mammary System",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Text(
                                        quiz5Score.toStringAsFixed(1),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                      ),
                                      Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                              ],
                                                       ),
                           ),
                        
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Final Score",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                              ),
                              Text(
                                finalScore,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CustomButton(
                          //   text: "Edit",
                          //   color: AppColors.grey,
                          //   width: 32.w,
                          //   onTap: () {
                          //    AppCustomNavigator.pop(context);
                          //    AppCustomNavigator.pop(context);
                          //    AppCustomNavigator.pop(context);
                          //    AppCustomNavigator.pop(context);
                          //    AppCustomNavigator.pop(context);
                          //    AppCustomNavigator.pop(context);
                          //   },
                          // ),
                          CustomButton(
                            text: "Confirm",
                            width: 32.w,
                            onTap: () {
                              PopupDialogComplete.show(context, finalScoreInt);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
