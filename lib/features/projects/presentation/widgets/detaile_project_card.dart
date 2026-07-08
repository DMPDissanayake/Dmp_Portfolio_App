import 'package:dmpportfolioapp/features/projects/data/models/project_model.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_card_button.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetaileProjectCard extends StatelessWidget {
  final ProjectModel projectModel;
  const DetaileProjectCard({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        projectModel.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.kFontSize14,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().textBlackColor1,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.initColors().primaryColor.withOpacity(
                          0.15,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          width: 1,
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                      child: Text(
                        projectModel.category,
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
                SizedBox(height: 12.h),
                Text(
                  projectModel.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimensions.kFontSize11,
                    height: AppDimensions.kLineHeight14(18),
                    letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                    fontStyle: FontStyle.italic,
                    color: AppColors.initColors().nonChangeBlack.withOpacity(
                      0.6,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: projectModel.bulletPoints.map((highlight) {
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AppDimensions.kFontSize11,
                                height: AppDimensions.kLineHeight14(18),
                                letterSpacing: AppDimensions.kLetterSpacing14(
                                  1,
                                ),
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
                SizedBox(height: 6.h),
                Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  children: projectModel.techStack
                      .map(
                        (tech) => ProjectSkillsLaber(
                          label: tech,
                          color: AppColors.initColors().successColor,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          SizedBox(height: 6.h),
          Divider(color: AppColors.initColors().primaryColor, thickness: 1),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                ProjectCardButton(icon: AppImages.svgGithub, title: 'Github'),
                SizedBox(width: 24.w),
                ProjectCardButton(icon: AppImages.svgUrl, title: 'Live Link'),
              ],
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
