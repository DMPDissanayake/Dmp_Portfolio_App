import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSkilRow extends StatelessWidget {
  final String skillName;
  const ProfileSkilRow({super.key, required this.skillName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
          padding: EdgeInsets.all(2.w),
          child: Icon(
            Icons.star,
            color: AppColors.initColors().primaryColor,
            size: 14.h,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          skillName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: AppDimensions.kFontSize11,
            height: AppDimensions.kLineHeight14(18),
            letterSpacing: AppDimensions.kLetterSpacing14(1.5),
            color: AppColors.initColors().textBlackColor1,
          ),
        ),
      ],
    );
  }
}
