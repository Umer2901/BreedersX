import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/home/Quiz/quiz4.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/quize3_provider.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/provider/scoring_entry_provider.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';
// ignore_for_file: use_build_context_synchronously






class Quiz3 extends StatefulWidget {
  const Quiz3({super.key});

  @override
  State<Quiz3> createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  int selectedOption = -1;
  
  final List<ListItem> items = [
    ListItem(text: 'Rump: Tail head is set slightly above and neatly between pin bones, and the tail is free from coarseness', percentage: '22%'),
    ListItem(text: 'Rump: Pins should be adequately spaced and slightly lower (2 inches) then hip bones; rump should be long with thurls of proportionate width.', percentage: '26%'),
    ListItem(text: 'Vulva: Is nearly vertical and the anus should not be recessed', percentage: '26%'),
    ListItem(text: 'Back: Should be straight and strong; the loin-broad, strong, and nearly level', percentage: '26%'),
  ];

  @override
  void initState() {
    super.initState();
    context.read<Quiz3Provider>().setId(
          context.read<CowScoringEntryProvider>().id!,
        );
  }
  
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<Quiz3Provider>(context);
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 3),
            ),
            Text(
              "3/5",
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
                  'What is your weight?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3-Rump',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '15%',
                      style: Theme.of(context).textTheme.headlineSmall,
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
                            child:  Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                enableBorder: false,
                                name: 'Detail',
                                hintText: 'Enter the details, Must be 1-50 words',
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
                SizedBox(height: 4.h),
                Consumer<Quiz3Provider>(
                    builder: (context, quizProvider, child) {
                  return Column(
                    children: [
                      CustomButton(
                        text: 'Next',
                        onTap: () async {
                          await quizProvider.saveQuiz3Data();
                          if (!quizProvider.isLoading) {
                            AppCustomNavigator.push(context, const Quiz4());
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