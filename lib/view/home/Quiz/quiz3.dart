import 'package:breedex/view/widget/popup1.dart';
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
     final bool isComplete;
  const Quiz3({super.key, required this.isComplete});

  @override
  State<Quiz3> createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();
  int selectedOption = -1;
  
  final List<ListItem> items = [
    ListItem(text: 'Rump: Tail head is set slightly above and neatly between pin bones, and the tail is free from coarseness', percentage: '22%',weight: 22.0),
    ListItem(text: 'Rump: Pins should be adequately spaced and slightly lower (2 inches) then hip bones; rump should be long with thurls of proportionate width.(Ideal +/-25)', percentage: '26%',
        weight: 26.0),
    ListItem(text: 'Vulva: Is nearly vertical and the anus should not be recessed', percentage: '26%',
        weight: 26.0),
    ListItem(text: 'Back: Should be straight and strong; the loin-broad, strong, and nearly level', percentage: '26%',
        weight: 26.0),
  ];

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final quizProvider = context.read<Quiz3Provider>();
      quizProvider.setBuilding(true);
      quizProvider.setId(context.read<CowScoringEntryProvider>().id!);
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
    final quizProvider = Provider.of<Quiz3Provider>(context);
    quizProvider.setBuilding(true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizProvider.setBuilding(false);
    });
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
                        '3-Rump',
                       style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '15%',
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
                              child:  Padding(
                                padding:  const EdgeInsets.all(8.0),
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
                                    quizProvider.addDetail(index, value!);
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
                      'Your Score is: ${double.parse(quizProvider.quizData.score).toStringAsFixed(2)}%',
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
                            if (_formKey.currentState!.validate()) {
                              await quizProvider.saveQuiz3Data();
                              if (!quizProvider.isLoading) {
                                if (widget.isComplete) {
                        final cowId = context.read<CowScoringEntryProvider>().id!;
                       PopupDialog.show(context, cowId);
        } else {
          AppCustomNavigator.push(context, const Quiz4(isComplete: false));
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