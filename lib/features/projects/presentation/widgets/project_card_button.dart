import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProjectCardButton extends StatelessWidget {
  final String icon;
  final String title;
  const ProjectCardButton({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.8),
            height: 14.h,
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppDimensions.kFontSize11,
              height: AppDimensions.kLineHeight14(18),
              letterSpacing: AppDimensions.kLetterSpacing14(1),
              color: AppColors.initColors().nonChangeBlack.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
