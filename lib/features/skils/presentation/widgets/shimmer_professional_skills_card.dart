import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ShimmerProfessionalSkillsCard extends StatelessWidget {
  const ShimmerProfessionalSkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer() : _buildWebShimmer();
  }

  Widget _buildMobileShimmer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrandedShimmer(height: 34.h, width: 34.h, borderRadius: 8.r),
            SizedBox(height: 8.h),
            const StrandedShimmer(height: 12, width: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildWebShimmer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor.withOpacity(0.25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            StrandedShimmer(height: 48, width: 48, borderRadius: 10),
            SizedBox(height: 12),
            StrandedShimmer(height: 14, width: 100),
          ],
        ),
      ),
    );
  }
}
