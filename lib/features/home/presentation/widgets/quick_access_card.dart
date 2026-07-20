import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AccessCard extends StatefulWidget {
  final String icon;
  final Function onTap;
  final String name;
  const AccessCard({
    super.key,
    required this.icon,
    required this.onTap,
    required this.name,
  });

  @override
  State<AccessCard> createState() => _AccessCardState();
}

class _AccessCardState extends State<AccessCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileCard() : _buildWebCard();
  }

  // MOBILE (unchanged)
  Widget _buildMobileCard() {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        width: 73.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 1,
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
        child: Padding(
          padding: EdgeInsets.all(4.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.icon,
                fit: BoxFit.cover,
                color: AppColors.initColors().primaryColor,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.initColors().textBlackColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WEB / DESKTOP — hover-lift card
  Widget _buildWebCard() {
    final primary = AppColors.initColors().primaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: 120,
          height: 120,
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
          decoration: BoxDecoration(
            color: _isHovered ? primary : AppColors.initColors().nonChangeWhite,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 1.5, color: primary),
            boxShadow: [
              BoxShadow(
                color:
                    (_isHovered
                            ? primary
                            : AppColors.initColors().nonChangeBlack)
                        .withOpacity(_isHovered ? 0.28 : 0.10),
                offset: Offset(0, _isHovered ? 10 : 4),
                blurRadius: _isHovered ? 24 : 16,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? Colors.white.withOpacity(0.15)
                        : primary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    widget.icon,
                    fit: BoxFit.cover,
                    color: _isHovered ? Colors.white : primary,
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: _isHovered
                        ? Colors.white
                        : AppColors.initColors().textBlackColor1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
