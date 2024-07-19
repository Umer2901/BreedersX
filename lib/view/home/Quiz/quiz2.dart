import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import '../../widget/custom_button.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/model/lists_models.dart';
import 'package:breedex/view/home/Quiz/quiz3.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/quize2_provider.dart';
import 'package:breedex/provider/scoring_entry_provider.dart';
import 'package:breedex/view/widget/custom_progress_bar.dart';

// ignore_for_file: use_build_context_synchronously







class Quiz2 extends StatefulWidget {
  const Quiz2({super.key});

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  final List<TextEditingController> _controllers =
      List.generate(10, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();
  int selectedOption = -1;
 final List<ListItem> items = [
    ListItem(text: 'Ribs: Well sprung - not slab sided', percentage: '10%',
        weight: 10.0),
    ListItem(text: 'Disposition: Calm, easy demeanor', percentage: '15%',weight: 15.0),
    ListItem(text: 'Body Condition: Appropriate for the stage of lactation/environment', percentage: '10%',weight: 10.0),
    ListItem(text: 'Breed Characteristics: Overall style, strength, and balance. Head should be feminine', percentage: '10%',weight: 10.0),
    ListItem(text: 'Poll: Flat and upward V-shape', percentage: '20%',weight: 20.0),
    ListItem(text: 'Brisket: Clean & free of excess fleshiness', percentage: '10%',weight: 10.0),
    ListItem(text: 'Horns: Adequete length. Horn base tied in smoothly. No bulbous base or ballooned.', percentage: '10%',weight: 10.0),
    ListItem(text: 'Tail: Long and slender', percentage: '5%',weight: 5.0),
    ListItem(text: 'Underline: Trim-free of extra skin', percentage: '5%',weight: 5.0),
    ListItem(text: 'Ears: Rounded help up tight to horn', percentage: '5%',weight: 5.0),
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
      final quizProvider = context.read<Quiz2Provider>();
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
    final quizProvider = Provider.of<Quiz2Provider>(context);
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
              child: const CustomLinearProgressBar(maxSteps: 5, currentStep: 2),
            ),
            Text(
              "2/5",
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
                  Text(
                    'How old are you?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 2.h),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       '2-Breed Characteristics',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '25%',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  items.asMap().entries.map((entry) 
                    {
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
                                padding: const EdgeInsets.all(8.0),
                                child: CustomTextField(
                                  enableBorder: false,
                                  name: 'Detail',
                                  hintText: 'Your Number must be between 1-50',
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
                      'Your Score is: ${quizProvider.quizData.score}%',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                 SizedBox(height: 2.h),
                  Consumer<Quiz2Provider>(
                      builder: (context, quizProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Next',
                          onTap: () async {
                           if (_formKey.currentState!.validate()) {
                              await quizProvider.saveQuiz2Data();
                              if (!quizProvider.isLoading) {
                                AppCustomNavigator.push(context, const Quiz3());
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
