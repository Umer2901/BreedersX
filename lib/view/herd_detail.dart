
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'package:breedex/navigator.dart';
import 'package:breedex/view/home/cow_scoring_entry.dart';
import 'package:flutter/material.dart';
import 'package:breedex/model/scoring_entery_model.dart';
import 'package:breedex/services/scoring_entry_services.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:sizer/sizer.dart';

class HerdDeatilPage extends StatefulWidget {
  final herd;

  const HerdDeatilPage({super.key, required this.herd});

  @override
  State<HerdDeatilPage> createState() => _HerdDeatilPageState();
}

class _HerdDeatilPageState extends State<HerdDeatilPage> {
  List<ScoringEntry> scoringEntries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchScoringEntries();
  }

  Future<void> fetchScoringEntries() async {
    try {
      scoringEntries = await CowScoringEntryServices().getEntriesByHerdId(widget.herd.id);
    } catch (e) {
      print('Error fetching scoring entries: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){Navigator.pop(context);},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_back),
            ),
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
            child: GestureDetector(
              onTap: () {
                AppCustomNavigator.push(context, CowScoring(herdId: widget.herd.id,));
              },
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
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Cows',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 90.h,
                      child: ListView.builder(
                        itemCount: scoringEntries.length,
                        itemBuilder: (BuildContext context, int index) {
                          final entry = scoringEntries[index];
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
                                      "Cow Id: ${entry.cowid}",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    title: Text(
                                     "Name: ${entry.name}",
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    subtitle: Text(
                                       "Dob: ${entry.dob}",
                                     
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.sp, right: 8.sp, bottom: 8.sp),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                 Text(
                                               "Sire: ${entry.sire}",
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  "Dam: ${entry.dam}",
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                               
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                 "Final Score: ${entry.finalScore}",
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                                Text(
                                                 "Time of Calved: ${entry.timeOfCalved}",
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
