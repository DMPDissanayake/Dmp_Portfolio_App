import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_constants.dart';
import 'package:dmpportfolioapp/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DmpPortfolioApp extends StatelessWidget {
  const DmpPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap your app with ScreenUtilInit
    return ScreenUtilInit(
      // Provide the design size for your app
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: ThemeData(
            primaryColor: AppColors.initColors().primaryColor,
            scaffoldBackgroundColor: AppColors.initColors().primaryColor,
            useMaterial3: true,
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
