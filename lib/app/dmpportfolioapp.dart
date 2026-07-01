import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_constants.dart';
import 'package:dmpportfolioapp/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
            fontFamily: 'AvenirArabic',
            primaryColor: AppColors.initColors().primaryColor,
            scaffoldBackgroundColor: AppColors.initColors().primaryColor,
            useMaterial3: true,
          ),
          routerConfig: appRouter,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}
