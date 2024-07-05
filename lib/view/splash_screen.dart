import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:provider/provider.dart';
import 'package:breedex/view/welcome.dart';
import 'package:breedex/constants/colors.dart';
import 'package:breedex/constants/images.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:breedex/provider/splash_provider.dart';
// ignore_for_file: library_private_types_in_public_api

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
    Provider.of<LoadingProvider>(context, listen: false).setLoading(false);
    AppCustomNavigator.replace(context , const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              AppImages.logo, 
              width: 50.w,
              height: 50.h,
            ),
            Consumer<LoadingProvider>(
              builder: (context, loader, _) {
                return loader.isLoading
                    ?  SpinKitCircle(
                size: 70.sp,
                color: AppColors.primary,
              )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}