import 'package:breedex/constants/images.dart';
import 'package:flutter/widgets.dart';
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

class HerdDeatilPage extends StatefulWidget {
  const HerdDeatilPage({super.key});

  @override
  State<HerdDeatilPage> createState() => _HerdDeatilPageState();
}

class _HerdDeatilPageState extends State<HerdDeatilPage> {
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
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Detail',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20.h,
              width: 10.w,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(AppImages.add, color: AppColors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Cow Scoring',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 90.h,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Theme(
                      
  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              
                              trailing: Text(
                                '90+',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              title: Text(
                                'Cow Name',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                'Milk Production',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.sp,right:8.sp,bottom: 8.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '1 Sept 2005',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                           Text(
                                            'Sir Here',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hire here',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                       Text(
                                        'time calved',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                    ],
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
