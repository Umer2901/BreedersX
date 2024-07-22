import 'package:breedex/constants/images.dart';
import 'package:breedex/view/herd_detail.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: Image.asset(AppImages.power,color: AppColors.black,)
          ),
        ),
        centerTitle: true,
        title: Text(
          'Home',
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
            child: Image.asset(AppImages.add,color: AppColors.black,)
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
                'All Herd',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                          height: 2.h,
                        ),
              Container(
                height: 900.h, 
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                        color: AppColors.grey
                            ),
                            
                          ),
                          child: ListTile(
                           onTap: (){
                            AppCustomNavigator.push(context, HerdDeatilPage());
                           },
                            trailing: Text(
                                    '130 Heads',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ) ,
                            title: Text(
                                    'Ranch Name',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  subtitle: Text(
                                    'Your Location Here',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ) ,
                          ),
                          
                        ),
                        SizedBox(
                          height: 2.h,
                        )
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
