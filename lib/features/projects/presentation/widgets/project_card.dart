import 'package:dmpportfolioapp/features/projects/domain/entities/project_entity.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_logo_card.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectCard extends StatefulWidget {
  final ProjectEntity project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileCard(context) : _buildWebCard(context);
  }

  // MOBILE (unchanged)
  Widget _buildMobileCard(BuildContext context) {
    return Container(
      width: 160.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(
          width: 1.w,
          color: AppColors.initColors().primaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
            offset: const Offset(4, 0),
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
              AppImages.projectExPng,
              fit: BoxFit.cover,
              height: 90.h,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.initColors().nonChangeWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.h),
                bottomRight: Radius.circular(15.h),
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
                            logo: AppImages.svgEv,
                            color: AppColors.initColors().successColor,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              widget.project.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                          ),
                          const Spacer(),
                          Icon(
                            Icons.favorite_outline,
                            color: AppColors.initColors().primaryColor,
                            size: 16.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Text(
                        widget.project.subtitle,
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
                                color: AppColors.initColors().successColor,
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
                      _detailsButton(),
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

  // WEB / DESKTOP
  Widget _buildWebCard(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: EdgeInsets.symmetric(horizontal: 65, vertical: 6.h),
        transform: Matrix4.identity()..scale(_isHovered ? 1.01 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 1,
            color: _isHovered
                ? AppColors.initColors().primaryColor
                : AppColors.initColors().primaryColor.withOpacity(0.35),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.initColors().nonChangeBlack.withOpacity(
                _isHovered ? 0.16 : 0.08,
              ),
              offset: Offset(0, _isHovered ? 10 : 4),
              blurRadius: _isHovered ? 28 : 16,
              spreadRadius: 0,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---- Image ----
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: SizedBox(
                  width: 280,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(AppImages.projectExPng, fit: BoxFit.cover),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isHovered ? 1 : 0,
                        child: Container(
                          color: AppColors.initColors().nonChangeBlack
                              .withOpacity(0.25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---- Content ----
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ProjectLogoCard(
                                logo: AppImages.svgEv,
                                color: AppColors.initColors().successColor,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  widget.project.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    height: 1.2,
                                    color:
                                        AppColors.initColors().textBlackColor1,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.initColors().primaryColor,
                                  size: 20,
                                ),
                                splashRadius: 18,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.project.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              color: AppColors.initColors().textBlackColor1
                                  .withOpacity(0.55),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: widget.project.technologies
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

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _iconChip(AppImages.svgGithub),
                              const SizedBox(width: 10),
                              _iconChip(AppImages.svgUrl),
                            ],
                          ),
                          _detailsButton(webSize: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Shared small pieces
  Widget _iconChip(String asset) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SvgPicture.asset(
        asset,
        color: AppColors.initColors().primaryColor,
        height: 16,
      ),
    );
  }

  Widget _detailsButton({bool webSize = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: webSize ? 14 : 6.w,
        vertical: webSize ? 10 : 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor,
        borderRadius: BorderRadius.circular(webSize ? 8 : 2.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: webSize ? 13 : AppDimensions.kFontSize10,
              height: AppDimensions.kLineHeight14(14),
              letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
              color: AppColors.initColors().nonChangeWhite,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.initColors().nonChangeWhite,
            size: webSize ? 12 : 12.h,
          ),
        ],
      ),
    );
  }
}
