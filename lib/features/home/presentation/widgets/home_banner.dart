import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeBanner extends StatefulWidget {
  final ProfileEntity profileEntity;
  final VoidCallback? onViewProjects;
  final VoidCallback? onDownloadCv;

  const HomeBanner({
    super.key,
    required this.profileEntity,
    this.onViewProjects,
    this.onDownloadCv,
  });

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileBanner() : _buildWebBanner();
  }

  // MOBILE (unchanged)
  Widget _buildMobileBanner() {
    return Container(
      width: double.infinity,
      height: 0,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImages.homeBenner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36.r),
          bottomRight: const Radius.circular(0),
          topLeft: const Radius.circular(0),
          topRight: const Radius.circular(0),
        ),
        border: Border(
          bottom: BorderSide(
            width: 1.w,
            color: AppColors.initColors().primaryColor,
          ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.kFontSize14,
                      color: AppColors.initColors().textBlackColor1,
                      fontFamily: 'AvenirArabic',
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'I’m ${widget.profileEntity.name} \n'),
                      TextSpan(
                        text: widget.profileEntity.title,
                        style: TextStyle(
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                      const TextSpan(text: ' Developer'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Lottie.asset(AppImages.mADevelopment, height: 70.h),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.initColors().nonChangeBlack.withOpacity(
                      0.15,
                    ),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.network(
                  widget.profileEntity.profileUrl,
                  height: 90.h,
                  width: 90.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 90.h,
                      width: 90.h,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WEB / DESKTOP — hero section
  Widget _buildWebBanner() {
    final primary = AppColors.initColors().primaryColor;
    final textColor = AppColors.initColors().textBlackColor1;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 440),
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImages.homeBenner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 1.5, color: primary),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.10),
            offset: const Offset(0, 8),
            blurRadius: 32,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ---- Left: intro & CTAs ----
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Available for freelance work',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: primary,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      height: 1.15,
                      color: textColor,
                      fontFamily: 'AvenirArabic',
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Hi, I\'m ${widget.profileEntity.name}\n'),
                      TextSpan(
                        text: widget.profileEntity.title,
                        style: TextStyle(color: primary),
                      ),
                      const TextSpan(text: ' Developer'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'I design and build clean, reliable mobile & web '
                  'experiences — from idea to production.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.6,
                    color: textColor.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    _PrimaryButton(
                      label: 'View Projects',
                      color: primary,
                      onTap: widget.onViewProjects ?? () {},
                    ),
                    const SizedBox(width: 14),
                    _OutlineButton(
                      label: 'Download CV',
                      color: primary,
                      onTap: widget.onDownloadCv ?? () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 32),

          // ---- Right: profile visual ----
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primary.withOpacity(0.08),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: primary.withOpacity(0.5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.initColors().nonChangeBlack
                              .withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.profilePng,
                        height: 260,
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -6,
                    right: 6,
                    child: Lottie.asset(AppImages.mADevelopment, height: 90),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Buttons
class _PrimaryButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _PrimaryButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hover
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          transform: Matrix4.translationValues(0, _hover ? -2 : 0, 0),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _OutlineButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: _hover ? widget.color.withOpacity(0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.color, width: 1.5),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
