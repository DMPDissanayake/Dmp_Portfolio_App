import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_skills_laber.dart';
import 'package:dmpportfolioapp/features/skils/domain/entities/skil_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TechicalSkillsCard extends StatefulWidget {
  final SkilEntity data;
  const TechicalSkillsCard({super.key, required this.data});

  @override
  State<TechicalSkillsCard> createState() => _TechicalSkillsCardState();
}

class _TechicalSkillsCardState extends State<TechicalSkillsCard> {
  bool _isHovered = false;

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
      width: double.infinity,
      height: 95.h,
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
            offset: const Offset(4, 0),
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
                SvgPicture.asset(
                  AppImages.svgMobileDelopment,
                  fit: BoxFit.cover,
                  color: AppColors.initColors().primaryColor,
                  height: 18.h,
                ),
                SizedBox(width: 4.h),
                Expanded(
                  child: Text(
                    widget.data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.kFontSize12,
                      height: AppDimensions.kLineHeight14(18),
                      letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().textBlackColor1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            if (widget.data.items!.isNotEmpty)
              Wrap(
                spacing: 4.w,
                runSpacing: 4.h,
                children: widget.data.items!
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
    );
  }

  // ---------------------------------------------------------------------
  // WEB / DESKTOP — auto-height card with hover lift
  // ---------------------------------------------------------------------
  Widget _buildWebCard() {
    final primary = AppColors.initColors().primaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: double.infinity,
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: 1,
            color: _isHovered ? primary : primary.withOpacity(0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.initColors().nonChangeBlack.withOpacity(
                _isHovered ? 0.14 : 0.06,
              ),
              offset: Offset(0, _isHovered ? 10 : 4),
              blurRadius: _isHovered ? 24 : 14,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppImages.svgMobileDelopment,
                      fit: BoxFit.cover,
                      color: primary,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.data.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 1.3,
                        color: AppColors.initColors().textBlackColor1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (widget.data.items!.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.data.items!
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
      ),
    );
  }
}
