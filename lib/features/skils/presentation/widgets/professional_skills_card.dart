import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfessionalSkillsCard extends StatefulWidget {
  final String skill;
  // Optional so existing call sites (ProfessionalSkillsCard(skill: ...)) keep working.
  // Defaults to the original hardcoded icon.
  final String icon;

  const ProfessionalSkillsCard({
    super.key,
    required this.skill,
    this.icon = AppImages.svgCommunication,
  });

  @override
  State<ProfessionalSkillsCard> createState() => _ProfessionalSkillsCardState();
}

class _ProfessionalSkillsCardState extends State<ProfessionalSkillsCard> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: AppColors.initColors().primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    widget.icon,
                    color: AppColors.initColors().primaryColor,
                    height: 18.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              widget.skill,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: AppDimensions.kFontSize12,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().textBlackColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // WEB / DESKTOP — hover-lift tile
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
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: _isHovered ? primary : AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: _isHovered ? primary : primary.withOpacity(0.25),
          ),
          boxShadow: [
            BoxShadow(
              color:
                  (_isHovered ? primary : AppColors.initColors().nonChangeBlack)
                      .withOpacity(_isHovered ? 0.25 : 0.08),
              offset: Offset(0, _isHovered ? 10 : 4),
              blurRadius: _isHovered ? 22 : 14,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? Colors.white.withOpacity(0.15)
                      : primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  widget.icon,
                  color: _isHovered ? Colors.white : primary,
                  height: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.skill,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  height: 1.3,
                  color: _isHovered
                      ? Colors.white
                      : AppColors.initColors().textBlackColor1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfessionalSkills {
  final String title;
  final String icon;
  ProfessionalSkills({required this.title, required this.icon});
}
