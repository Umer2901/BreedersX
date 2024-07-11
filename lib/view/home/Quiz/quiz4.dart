import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/home/Quiz/quiz5.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/quize4_provider.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/provider/scoring_entry_provider.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
// ignore_for_file: use_build_context_synchronously

class Quiz4 extends StatefulWidget {
  const Quiz4({super.key});

  @override
  State<Quiz4> createState() => _Quiz4State();
}

class _Quiz4State extends State<Quiz4> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  int selectedOption = -1;
  final List<ListItem> items = [
    ListItem(
        text: 'Movement: Free and comfortable; able to rise and lie down easy',
        percentage: '35%'),
    ListItem(
        text:
            'Feet: Steep angle and deep heel with short, well rounded, closed toes',
        percentage: '20%'),
    ListItem(
        text:
            'Legs: Front and Rear: Tracking straight, wide apart with feet squarely placed. Hocks: Cleanly molded, free from coarseness and puffiness with adequate flexibility.',
        percentage: '10%'),
    ListItem(
        text: 'Rear legs - Side View: A moderate set (angle) to the hock.',
        percentage: '10%'),
    ListItem(
        text:
            'Thurl Position: Centrally placed between hip bones and pin bones',
        percentage: '15%'),
    ListItem(text: 'Pasterns: Short, strong, flexible', percentage: '10%'),
  ];

  @override
  void initState() {
    super.initState();
    context.read<Quiz4Provider>().setId(
          context.read<CowScoringEntryProvider>().id!,
        );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<Quiz4Provider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 4),
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
                SizedBox(height: 4.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.asMap().entries.map((entry) {
                    int index = entry.key;
                    ListItem item = entry.value;
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Text(
                                item.percentage,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                enableBorder: false,
                                name: 'Detail',
                                hintText:
                                    'Enter the details, Must be 1-50 words',
                                fillColor: Colors.white,
                                maxLines: 3,
                                minLines: 1,
                                controller: _controllers[index],
                                onChanged: (value) {
                                  quizProvider.addDetail(index, value!);
                                },
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
                Consumer<Quiz4Provider>(
                    builder: (context, quizProvider, child) {
                  return Column(
                    children: [
                      CustomButton(
                        text: 'Next',
                        onTap: () async {
                          await quizProvider.saveQuiz4Data();
                          if (!quizProvider.isLoading) {
                            AppCustomNavigator.push(context, const Quiz5());
                          }
                        },
                      ),
                      if (quizProvider.isLoading)
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: const CircularProgressIndicator(),
                        ),
                    ],
                  );
                }),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
