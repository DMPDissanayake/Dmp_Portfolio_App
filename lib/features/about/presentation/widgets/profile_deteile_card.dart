import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';
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
import 'package:responsive_framework/responsive_framework.dart';

class ProfileDeteileCard extends StatelessWidget {
  final ProfileEntity data;
  const ProfileDeteileCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileCard() : _buildWebCard();
  }

  // ---------------------------------------------------------------------
  // MOBILE (unchanged)
  // ---------------------------------------------------------------------
  Widget _buildMobileCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(16.r),
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
                    subtitle: data.title,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.w, color: AppColors.initColors().primaryColor),
            SizedBox(height: 4.h),
            Text(
              '👋 Hi, I\'m ${data.name}',
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
              data.bio,
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
                      height: 18.h,
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
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SvgPicture.asset(
                        AppImages.svgContact,
                        height: 18.h,
                        color: AppColors.initColors().nonChangeBlack,
                      ),
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

  // ---------------------------------------------------------------------
  // WEB / DESKTOP — two-column bio + sidebar layout
  // ---------------------------------------------------------------------
  Widget _buildWebCard() {
    final primary = AppColors.initColors().primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 65, vertical: 8),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.08),
            offset: const Offset(0, 8),
            blurRadius: 28,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EduactionTitleSkilCard(title: 'About Me', subtitle: data.title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(thickness: 1, color: primary.withOpacity(0.4)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Left: bio & skill highlights ----
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '👋 Hi, I\'m ${data.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        height: 1.3,
                        color: AppColors.initColors().textBlackColor1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data.bio,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        height: 1.7,
                        color: AppColors.initColors().textBlackColor1
                            .withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children:
                          const [
                                '10+ Projects',
                                'Flutter Developer',
                                'REST API',
                                'Clean Architecture',
                              ]
                              .map((skill) => ProfileSkilRow(skillName: skill))
                              .toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 32),

              // ---- Right: stats & CTA sidebar ----
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 1,
                      color: primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkillsCountCard(title: 'Projects', count: 10),
                          SkillsCountCard(title: 'Years', count: 2),
                          SkillsCountCard(title: 'Skills', count: 10),
                        ],
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        buttonText: 'Download Cv',
                        onTapButton: () {},
                        buttonColor: primary,
                        textColor: AppColors.initColors().nonChangeWhite,
                        prefixIcon: SvgPicture.asset(
                          AppImages.svgDownload,
                          height: 18,
                          color: AppColors.initColors().nonChangeWhite,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppButtonOutline(
                        buttonText: 'Contacts',
                        hasBorder: true,
                        onTapButton: () {},
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            AppImages.svgContact,
                            height: 18,
                            color: AppColors.initColors().nonChangeBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
