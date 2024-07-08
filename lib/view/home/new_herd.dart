import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/model/herd_model.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/view/widget/textfield.dart';
import 'package:breedex/provider/herd_provider.dart';
import 'package:breedex/view/widget/custom_button.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// ignore_for_file: use_build_context_synchronously

class NewHerd extends StatefulWidget {
  const NewHerd({super.key});

  @override
  State<NewHerd> createState() => _NewHerdState();
}

class _NewHerdState extends State<NewHerd> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Start New Herd',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
                    'Ranch Name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'name',
                    hintText: 'Your Name',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'Location',
                    hintText: 'Your Location',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                    suffixIcon: const Icon(
                      Icons.arrow_downward,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Total Head Scored',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextField(
                    enableBorder: true,
                    name: 'head',
                    hintText: '12',
                    fillColor: AppColors.white,
                    validator: FormBuilderValidators.required(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 4.h),
                  Consumer<HerdProvider>(
                      builder: (context, herdProvider, child) {
                    return Column(
                      children: [
                        CustomButton(
                          text: 'Next',
                          onTap: () async {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              final herd = HerdModel(
                                  name: _formKey.currentState?.value['name'],
                                  location:
                                      _formKey.currentState?.value['Location'],
                                  headScore:
                                      _formKey.currentState?.value['head'],
                                  id: '3333');
                              await herdProvider.addHerd(herd);
                              if (!herdProvider.isLoading) {
                                AppCustomNavigator.push(
                                    context, const CowScoring());
                              }
                            }
                          },
                        ),
                        if (herdProvider.isLoading)
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
}
