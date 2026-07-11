import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsCountCard extends StatelessWidget {
  final String title;
  final int count;
  const SkillsCountCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count}+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize20,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().primaryColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppDimensions.kFontSize10,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().textBlackColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
