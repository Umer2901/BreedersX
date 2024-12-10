// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, sized_box_for_whitespace

import 'package:breedex/constants/images.dart';
import 'package:breedex/provider/auth_provider.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:breedex/view/herd_detail.dart';
import 'package:breedex/view/home/new_herd.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/provider/herd_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HerdProvider>(context, listen: false).fetchHerds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await Provider.of<AuthProvider>(context, listen: false).signOut(context);
              AppCustomNavigator.replace(context, const LoginScreen()); 
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(AppImages.power, color: AppColors.black),
            ),
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
            child: GestureDetector(
              onTap: () {
                AppCustomNavigator.replace(context, NewHerd());
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
      body: Consumer<HerdProvider>(
        builder: (context, herdProvider, child) {
          if (herdProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Herds',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: herdProvider.herds.length,
                    itemBuilder: (BuildContext context, int index) {
                      final herd = herdProvider.herds[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.grey,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                AppCustomNavigator.push(
                                    context, HerdDeatilPage(herd: herd));
                              },
                              trailing: Text(
                                '${herd.headScore} Head',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              title: Text(
                                "Ranch: ${herd.name}",
                                style:
                                    Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                'Location: ${herd.location}',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
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
          );
        },
      ),
    );
  }
}
