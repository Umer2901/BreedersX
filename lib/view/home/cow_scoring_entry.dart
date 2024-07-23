// ignore_for_file: unused_local_variable, use_super_parameters, use_build_context_synchronously

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/home/Quiz/quiz.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/model/scoring_entery_model.dart';
import 'package:breedex/provider/scoring_entry_provider.dart';
import 'package:breedex/provider/herd_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CowScoring extends StatefulWidget {
  final String herdId;

  const CowScoring({required this.herdId, Key? key}) : super(key: key);

  @override
  State<CowScoring> createState() => _CowScoringState();
}

class _CowScoringState extends State<CowScoring> {
  final _formKey = GlobalKey<FormBuilderState>();
  late TextEditingController? dateController;
  DateTime? _date;
  int selectedIndex = 0;
  List<String> options = [
    "Milk production",
    "Body condition",
    "Reproduction metrics"
  ];

  @override
  void initState() {
    super.initState();
    dateController = _date != null
        ? TextEditingController(
            text: DateFormat('MMMM dd, yyyy').format(_date!),
          )
        : TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HerdProvider>(context, listen: false).fetchHerds();
    });
  }

  @override
  void dispose() {
    dateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final herdProvider = Provider.of<HerdProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
        title: Text(
          'Cow Scoring Entry',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
          child: Center(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 3.h),
                  Text(
                    'Cow Name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'name',
                    hintText: 'Cow Name',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Date of Birth',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'DOB',
                    hintText: 'Date of Birth',
                    fillColor: AppColors.white,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.calendar_month),
                    controller: dateController,
                    onTap: () {
                      _selectDate(context);
                    },
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Dam',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'Dam',
                    hintText: 'Dam',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Sire',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'Sire',
                    hintText: 'Sire',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '# of Times Calved',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'timeCalved',
                    hintText: '12',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Scoring Entry',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'See all',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(options.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 35.sp,
                            margin: EdgeInsets.symmetric(horizontal: 3.sp),
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? AppColors.primary
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors.black,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Text(
                                  options[index],
                                  style: TextStyle(
                                    color: index == selectedIndex
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Consumer<CowScoringEntryProvider>(
                      builder: (context, scoringEntryProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Submit',
                          onTap: () async {
                            if (_formKey.currentState?.saveAndValidate() ?? false) {
                              final entry = ScoringEntry(
                                name: _formKey.currentState?.value['name'],
                                dob: dateController!.text,
                                dam: _formKey.currentState?.value['Dam'],
                                sire: _formKey.currentState?.value['Sire'],
                                timeOfCalved: _formKey.currentState?.value['timeCalved'],
                                scoringEntry: options[selectedIndex],
                                id: '',
                                herdId: widget.herdId, finalScore: '',
                              );
                              await scoringEntryProvider.addEntry(entry, widget.herdId);
                              if (!scoringEntryProvider.isLoading) {
                                AppCustomNavigator.push(context, const Quiz());
                              }
                            }
                          },
                        ),
                        if (scoringEntryProvider.isLoading)
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: const CircularProgressIndicator(),
                          ),
                      ],
                    );
                  }),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2401),
    );
    if (picked != null) {
      setState(() {
        _date = picked;
        dateController!.text = DateFormat('MMMM dd, yyyy').format(picked);
      });
      debugPrint('date ${dateController!.text}');
    }
  }
}