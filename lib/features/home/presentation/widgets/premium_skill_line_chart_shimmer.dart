import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PremiumSkillLineChartShimmer extends StatelessWidget {
  const PremiumSkillLineChartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer() : _buildWebShimmer();
  }

  Widget _buildMobileShimmer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
        ),
      ),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 24.w,
        top: 16.h,
        bottom: 16.h,
      ),
      child: SizedBox(
        height: 150.h,
        child: const StrandedShimmer(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildWebShimmer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(28, 24, 32, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    StrandedShimmer(height: 18, width: 150),
                    SizedBox(height: 8),
                    StrandedShimmer(height: 13, width: 250),
                  ],
                ),
              ),
              const StrandedShimmer(height: 50, width: 100, borderRadius: 10),
              const SizedBox(width: 10),
              const StrandedShimmer(height: 50, width: 100, borderRadius: 10),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(
            height: 260,
            child: StrandedShimmer(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
