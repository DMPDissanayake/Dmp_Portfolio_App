import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfessionalSkillsCard extends StatefulWidget {
  const ProfessionalSkillsCard({super.key});

  @override
  State<ProfessionalSkillsCard> createState() => _ProfessionalSkillsCardState();
}

class _ProfessionalSkillsCardState extends State<ProfessionalSkillsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // SvgPicture.asset(
                //   widget.icon,
                //   fit: BoxFit.cover,
                //   color: AppColors.initColors().primaryColor,
                //   height: 18.h,
                // ),
                SizedBox(width: 4.h),
                Text(
                  'widget.title',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppDimensions.kFontSize14,
                    height: AppDimensions.kLineHeight14(18),
                    letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                    color: AppColors.initColors().textBlackColor1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
