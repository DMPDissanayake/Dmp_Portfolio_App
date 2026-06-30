import 'package:dmpportfolioapp/utils/app_constants.dart';
import 'package:dmpportfolioapp/utils/enums.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors({
    required this.primaryColor,
    required this.appBGColor,
    required this.textBlackColor1,
    required this.appButtonColor,
    required this.whiteBackgroundColor,
    required this.appButtonBorderColor,
    required this.nonChangeWhite,
    required this.nonChangeBlack,
    required this.errorColor,
    required this.textFildeColor,
    required this.desabledAppButtonColor,
    required this.bottomNavigationBarUnselectColor,
    required this.successColor,
  });

  Color primaryColor;
  LinearGradient appBGColor;
  Color appButtonColor;
  Color textBlackColor1;
  Color whiteBackgroundColor;
  Color appButtonBorderColor;
  Color nonChangeWhite;
  Color nonChangeBlack;
  Color errorColor;
  Color textFildeColor;
  Color desabledAppButtonColor;
  Color bottomNavigationBarUnselectColor;
  Color successColor;

  static AppColors initColors() {
    if (AppConstants.selectedTheme == ThemeType.LIGHT) {
      return initializeLightColors();
    } else {
      return initializeDarkColors();
    }
  }

  static AppColors initializeLightColors() {
    return AppColors(
      primaryColor: const Color(0xFFFFB400),
      //appBGColor: const Color(0xFFE4E6EB),
      appBGColor: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFB400).withOpacity(0.4), // 0%
          Color(0xFFffffff), // 100%
        ],
      ),
      appButtonColor: const Color(0xFF004643),
      textBlackColor1: const Color(0xFF2B2B2B),
      desabledAppButtonColor: const Color.fromARGB(92, 0, 70, 67),
      appButtonBorderColor: const Color(0xFF004643),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      errorColor: Colors.red,
      successColor: Colors.green,
      whiteBackgroundColor: Colors.white,
      textFildeColor: const Color(0xFFC4C4C4),
      bottomNavigationBarUnselectColor: const Color(0xFF484C52),
    );
  }

  static AppColors initializeDarkColors() {
    return AppColors(
      primaryColor: const Color(0xFFFFB400),
      appBGColor: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFB400), // 0%
          Color(0xFFffffff), // 100%
        ],
      ),
      appButtonColor: const Color(0xFF004643),
      textBlackColor1: const Color(0xFF2B2B2B),
      desabledAppButtonColor: const Color.fromARGB(92, 0, 70, 67),
      appButtonBorderColor: const Color(0xFF004643),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      errorColor: Colors.red,
      successColor: Colors.green,
      whiteBackgroundColor: Colors.white,
      textFildeColor: const Color(0xFFC4C4C4),
      bottomNavigationBarUnselectColor: const Color(0xFF484C52),
    );
  }
}
