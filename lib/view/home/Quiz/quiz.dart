import 'package:breedex/view/widget/popup1.dart';
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
import 'package:breedex/provider/scoring_entry_provider.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';

class Quiz extends StatefulWidget {
  final bool isComplete;
  const Quiz({super.key, required this.isComplete});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<TextEditingController> _controllers =
      List.generate(7, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();

  final List<ListItem> items = [
    ListItem(text: 'Chest: Adequate width and spacing between front legs', percentage: '13%', weight: 13.0),
    ListItem(text: 'Heart Girth: Deep and well-sprung fore ribs blending into shoulders', percentage: '13%', weight: 13.0),
    ListItem(text: 'Bone Mass: Strong without coarseness', percentage: '10%', weight: 10.0),
    ListItem(text: 'Muzzle: Broad with large open nostrils and a strong jaw', percentage: '7%', weight: 7.0),
    ListItem(text: 'Shoulder Blades and Elbows: Firmly set against the chest wall', percentage: '17%', weight: 17.0),
    ListItem(text: 'Crops: Full', percentage: '15%', weight: 15.0),
    ListItem(text: 'Size: Volumetric measurement of the cow’s capacity', percentage: '25%', weight: 25.0),
  ];

  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final quizProvider = context.read<Quiz1Provider>();
      quizProvider.setBuilding(true);
      quizProvider.setId(context.read<CowScoringEntryProvider>().id!);

      // Set the text of the controllers to match the saved data
      for (int i = 0; i < quizProvider.quizData.details.length; i++) {
        _controllers[i].text = quizProvider.quizData.details[i];
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        quizProvider.setBuilding(false);
      });
      _isInit = false;
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final number = int.tryParse(value);
    if (number == null || number < 1 || number > 50) {
      return 'Please enter a number between 1 and 50';
    }
    return null;
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1-Strength & Substance',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '20%',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomTextField(
                                  enableBorder: false,
                                  name: 'Detail',
                                  hintText: '',
                                  fillColor: Colors.white,
                                  maxLines: 3,
                                  minLines: 1,
                                  keyboardType: TextInputType.number,
                                  controller: _controllers[index],
                                  onChanged: (value) {
                                    quizProvider.addDetail(index, value!);  // Update the provider
                                  },
                                  validator: _validateInput,
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
                      'Your Score is: ${quizProvider.quizData.score}%',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Consumer<Quiz1Provider>(builder: (context, quizProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Next',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await quizProvider.saveQuizData();
                              if (!quizProvider.isLoading) {
                                if (widget.isComplete) {
                                  final cowId = context.read<CowScoringEntryProvider>().id!;
                                  PopupDialog.show(context, cowId);
                                } else {
                                  AppCustomNavigator.push(context, const Quiz2(isComplete: false));
                                }
                              }
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
      ),
    );
  }
}
