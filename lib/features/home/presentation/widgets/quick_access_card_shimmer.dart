import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AccessCardShimmer extends StatelessWidget {
  const AccessCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer() : _buildWebShimmer();
  }

  Widget _buildMobileShimmer() {
    return Container(
      width: 60.w,
      height: 60.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StrandedShimmer(height: 24.r, width: 24.r, borderRadius: 12.r),
          SizedBox(height: 4.h),
          StrandedShimmer(height: 8.h, width: 40.w),
        ],
      ),
    );
  }

  Widget _buildWebShimmer() {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1.5,
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StrandedShimmer(height: 48, width: 48, borderRadius: 24),
          const SizedBox(height: 10),
          const StrandedShimmer(height: 13, width: 70),
        ],
      ),
    );
  }
}
