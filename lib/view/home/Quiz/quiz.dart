import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/home/Quiz/quiz2.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/quize1_provider.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
// ignore_for_file: use_build_context_synchronously


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
    final List<TextEditingController> _controllers =
      List.generate(7, (index) => TextEditingController());

  int selectedOption = -1;

  final List<ListItem> items = [
    ListItem(
        text: 'Chest: Adequete width and spacing between front legs',
        percentage: '13%'),
    ListItem(
        text:
            'Heart Girth: Deep and with well sprung fore ribs blending into shoulders',
        percentage: '13%'),
    ListItem(text: 'Bone Mass: Strong without coarseness', percentage: '10%'),
    ListItem(
        text: 'Muzzle: Broad with large open nostrils and a strong jaw',
        percentage: '7%'),
    ListItem(
        text: 'Shoulder Blades and Elbows: Firmly set against the chest wall',
        percentage: '17%'),
    ListItem(text: 'Crops: Full', percentage: '15%'),
    ListItem(
        text:
            'Size: The volumetric measurment of the capacity of the cow (LxWxH) is evaluated with age and breed recommendations taken into consdieration. Height at withers and hips should be realtively proportiate.',
        percentage: '25%'),
  ];

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<Quiz1Provider>(context);
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 1),
            ),
            Text(
              "1/5",
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
                  'Tell us about yourself?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1-Strength & Substance',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '20%',
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
                      buildOption(
                          'Lorem Ipsum is simply dummy text of the printing',
                          0,
                          quizProvider),
                      buildOption(
                          'Lorem Ipsum is simply dummy text of the printing',
                          1,
                          quizProvider),
                      buildOption(
                          'Lorem Ipsum is simply dummy text of the printing',
                          2,
                          quizProvider),
                      buildOption(
                          'Lorem Ipsum is simply dummy text of the printing',
                          3,
                          quizProvider),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
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
                    'Your Score is: ${quizProvider.quizData.score}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 4.h),
                Consumer<Quiz1Provider>(
                  builder: (context, quizProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Next',
                          onTap: () async {
                            await quizProvider.saveQuizData();
                            if (!quizProvider.isLoading) {
                            AppCustomNavigator.push(context, const Quiz2());
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
                    
                  }
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOption(String optionText, int index, Quiz1Provider quizProvider) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
          quizProvider.setOptionSelected(optionText);
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
                    border: Border.all(
                      color: AppColors.green,
                      width: 2,
                    ),
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
