import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickMetricsCard extends StatelessWidget {
  final int count;
  final String title;
  const QuickMetricsCard({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95.h,
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
            offset: Offset(4, 0),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count.toString()}+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize30,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().primaryColor,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppDimensions.kFontSize12,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().nonChangeBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
