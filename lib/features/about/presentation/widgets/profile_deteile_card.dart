import 'package:dmpportfolioapp/features/about/presentation/widgets/profile_skil_row.dart';
import 'package:dmpportfolioapp/features/about/presentation/widgets/skills_count_card.dart';
import 'package:dmpportfolioapp/features/education/presentation/widgets/eduaction_title_widget.dart';
import 'package:dmpportfolioapp/shared/common/app_button.dart';
import 'package:dmpportfolioapp/shared/common/app_button_outline.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDeteileCard extends StatelessWidget {
  const ProfileDeteileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(
          16.r,
        ), // Standard matching corner curves
        border: Border.all(
          width: 1,
          color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Row(
              children: [
                SizedBox(width: 18.w),
                Expanded(
                  child: EduactionTitleSkilCard(
                    title: 'About Me',
                    subtitle: 'Flutter Mobile Developer',
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.w, color: AppColors.initColors().primaryColor),
            SizedBox(height: 4.h),
            Text(
              '👋 Hi, I\'m DMP Dissanayake',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize14,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().textBlackColor1,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Flutter Developer passionate about building modern, scalable, and user-friendly mobile applications. I specialize in Flutter, Clean Architecture, BLoC state management, REST API integration, and responsive UI design.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppDimensions.kFontSize12,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(1.5),
                color: AppColors.initColors().textBlackColor1.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ProfileSkilRow(skillName: '10+ Projects')),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ProfileSkilRow(skillName: 'Flutter Developer'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ProfileSkilRow(skillName: 'REST API')),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ProfileSkilRow(skillName: 'Clean Architecture'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkillsCountCard(title: 'Projects', count: 10),
                SizedBox(width: 12.w),
                SkillsCountCard(title: 'Years', count: 2),
                SizedBox(width: 12.w),
                SkillsCountCard(title: 'Skills', count: 10),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    buttonText: 'Download Cv',
                    onTapButton: () {},
                    buttonColor: AppColors.initColors().primaryColor,
                    textColor: AppColors.initColors().nonChangeWhite,
                    prefixIcon: SvgPicture.asset(
                      AppImages.svgDownload,
                      height: 10.h,
                      color: AppColors.initColors().nonChangeWhite,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AppButtonOutline(
                    buttonText: 'Contacts',
                    hasBorder: true,

                    onTapButton: () {},
                    prefixIcon: SvgPicture.asset(
                      AppImages.svgDownload,
                      height: 10.h,
                      color: AppColors.initColors().nonChangeWhite,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
