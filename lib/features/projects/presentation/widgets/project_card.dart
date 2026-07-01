import 'package:dmpportfolioapp/features/projects/data/models/project_entity.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_logo_card.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProjectCard extends StatefulWidget {
  final ProjectEntity project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.h,
      clipBehavior: Clip.antiAlias, // This will clip the child widget
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(
          width: 1.w,
          color: AppColors.initColors().primaryColor,
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.asset(
              widget.project.images,
              fit: BoxFit.cover,
              height: 90.h,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.initColors().nonChangeWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.h), // Adjusted to match parent
                bottomRight: Radius.circular(15.h), // Adjusted to match parent
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ProjectLogoCard(
                            logo: widget.project.icon,
                            color: widget.project.color,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            widget.project.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AppDimensions.kFontSize10,
                              height: AppDimensions.kLineHeight14(14),
                              letterSpacing: AppDimensions.kLetterSpacing14(
                                -2.5,
                              ),
                              color: AppColors.initColors().textBlackColor1,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite_outline,
                            color: AppColors.initColors().primaryColor,
                            size: 16.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Text(
                        widget.project.fullDescription,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.kFontSize10,
                          height: AppDimensions.kLineHeight14(14),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().textBlackColor1
                              .withOpacity(0.3),
                        ),
                      ),
                      SizedBox(height: 8.w),
                      Wrap(
                        spacing: 4.w,
                        runSpacing: 4.h,
                        children: widget.project.technologies
                            .map(
                              (tech) => ProjectSkillsLaber(
                                label: tech,
                                color: widget.project.color,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.initColors().primaryColor,
                  thickness: 1.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h, right: 8.h, bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.svgGithub,
                            color: AppColors.initColors().primaryColor,
                            height: 14.h,
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            AppImages.svgUrl,
                            color: AppColors.initColors().primaryColor,
                            height: 14.h,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.initColors().primaryColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: AppDimensions.kFontSize10,
                                height: AppDimensions.kLineHeight14(14),
                                letterSpacing: AppDimensions.kLetterSpacing14(
                                  -2.5,
                                ),
                                color: AppColors.initColors().nonChangeWhite,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.initColors().nonChangeWhite,
                              size: 12.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
