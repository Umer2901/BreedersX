import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:breedex/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:breedex/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:breedex/provider/herd_provider.dart';
import 'package:breedex/provider/auth_provider.dart';
import 'package:breedex/provider/quize4_provider.dart';
import 'package:breedex/provider/quize3_provider.dart';
import 'package:breedex/provider/quize2_provider.dart';
import 'package:breedex/provider/quize1_provider.dart';
import 'package:breedex/provider/splash_provider.dart';
import 'package:breedex/provider/scoring_entry_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (context) => LoadingProvider()),
            ChangeNotifierProvider(create: (_) => HerdProvider()),
            ChangeNotifierProvider(create: (_) => CowScoringEntryProvider()),
            ChangeNotifierProvider(create: (_) => Quiz1Provider()),
            ChangeNotifierProvider(create: (_) => Quiz2Provider()),
            ChangeNotifierProvider(create: (_) => Quiz3Provider()),
            ChangeNotifierProvider(create: (_) => Quiz4Provider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Breedex',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.white,
              textTheme: TextTheme(
                displaySmall: GoogleFonts.montserrat(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                headlineLarge: GoogleFonts.montserrat(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                headlineMedium: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                headlineSmall: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                bodyLarge: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                bodyMedium: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                bodySmall: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          ));
    });
  }
}
