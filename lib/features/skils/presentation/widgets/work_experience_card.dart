import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/features/skils/domain/entities/experience_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkExperienceCard extends StatelessWidget {
  final ExperienceEntity workExperience;
  const WorkExperienceCard({super.key, required this.workExperience});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Removed width: double.infinity to let Expanded safely manage layout constraints
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
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
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row Layout for Header Items
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workExperience.role,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.kFontSize14,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().textBlackColor1,
                        ),
                      ),

                      Text(
                        workExperience.company,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.kFontSize12,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (workExperience.isCurrent == true)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.initColors().primaryColor.withOpacity(
                        0.3,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        width: 1,
                        color: AppColors.initColors().primaryColor,
                      ),
                    ),
                    child: Text(
                      'Current',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.kFontSize10,
                        height: AppDimensions.kLineHeight14(18),
                        letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                        color: AppColors.initColors().primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 2.h),
            // Period / Date Range duration text
            Text(
              workExperience.duration,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppDimensions.kFontSize10,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                fontStyle: FontStyle.italic,
                color: AppColors.initColors().nonChangeBlack.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 12.h),
            // Description Text Block
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: workExperience.responsibilities.map((highlight) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize12,
                          height: 1.4,
                          color: AppColors.initColors().textBlackColor1
                              .withOpacity(0.8),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          highlight,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimensions.kFontSize11,
                            height: AppDimensions.kLineHeight14(18),
                            letterSpacing: AppDimensions.kLetterSpacing14(1),
                            color: AppColors.initColors().textBlackColor1
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 12.h),
            // Render Skill Badge Row
            Wrap(
              spacing: 6.w,
              runSpacing: 6.h,
              children: workExperience.technologies
                  .map(
                    (tech) => ProjectSkillsLaber(
                      label: tech,
                      color: AppColors.initColors().primaryColor,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
