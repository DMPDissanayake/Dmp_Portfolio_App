import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ShimmerProfileDeteileCard extends StatelessWidget {
  const ShimmerProfileDeteileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer() : _buildWebShimmer();
  }

  Widget _buildMobileShimmer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(16.r),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            // Title Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StrandedShimmer(height: 16, width: 120),
                  SizedBox(height: 4.h),
                  const StrandedShimmer(height: 12, width: 200),
                ],
              ),
            ),
            Divider(thickness: 1.w, color: AppColors.initColors().primaryColor),
            SizedBox(height: 4.h),
            const StrandedShimmer(height: 16, width: 150), // "Hi, I'm..."
            SizedBox(height: 8.h),
            // Bio Shimmer
            const StrandedShimmer(height: 12, width: double.infinity),
            SizedBox(height: 4.h),
            const StrandedShimmer(height: 12, width: double.infinity),
            SizedBox(height: 4.h),
            const StrandedShimmer(height: 12, width: 220),
            SizedBox(height: 24.h),
            // Skill Rows Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: List.generate(
                  2,
                  (i) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        const Expanded(
                          child: StrandedShimmer(height: 20, width: 100),
                        ),
                        SizedBox(width: 8.w),
                        const Expanded(
                          child: StrandedShimmer(height: 20, width: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Count Cards Shimmer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: StrandedShimmer(
                    height: 50,
                    width: 70,
                    borderRadius: 8,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Buttons Shimmer
            Row(
              children: [
                const Expanded(
                  child: StrandedShimmer(height: 48, borderRadius: 24),
                ),
                SizedBox(width: 12.w),
                const Expanded(
                  child: StrandedShimmer(height: 48, borderRadius: 24),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildWebShimmer() {
    final primary = AppColors.initColors().primaryColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 65, vertical: 8),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.08),
            offset: const Offset(0, 8),
            blurRadius: 28,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Shimmer
          const StrandedShimmer(height: 20, width: 150),
          const SizedBox(height: 6),
          const StrandedShimmer(height: 14, width: 250),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(thickness: 1, color: primary.withOpacity(0.4)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column Shimmer
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StrandedShimmer(
                      height: 22,
                      width: 200,
                    ), // "Hi, I'm..."
                    const SizedBox(height: 12),
                    const StrandedShimmer(height: 15, width: double.infinity),
                    const SizedBox(height: 8),
                    const StrandedShimmer(height: 15, width: double.infinity),
                    const SizedBox(height: 8),
                    const StrandedShimmer(height: 15, width: 300),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(
                        4,
                        (i) => const StrandedShimmer(
                          height: 24,
                          width: 120,
                          borderRadius: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              // Right Column Shimmer
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 1,
                      color: primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StrandedShimmer(
                            height: 50,
                            width: 60,
                            borderRadius: 8,
                          ),
                          StrandedShimmer(
                            height: 50,
                            width: 60,
                            borderRadius: 8,
                          ),
                          StrandedShimmer(
                            height: 50,
                            width: 60,
                            borderRadius: 8,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      StrandedShimmer(height: 48, borderRadius: 24),
                      SizedBox(height: 12),
                      StrandedShimmer(height: 48, borderRadius: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
