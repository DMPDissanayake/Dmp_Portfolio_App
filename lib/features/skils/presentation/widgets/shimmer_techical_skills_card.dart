import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ShimmerTechicalSkillsCard extends StatelessWidget {
  const ShimmerTechicalSkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer() : _buildWebShimmer();
  }

  Widget _buildMobileShimmer() {
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
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StrandedShimmer(height: 18.h, width: 18.h, borderRadius: 4),
                SizedBox(width: 4.h),
                const Expanded(child: StrandedShimmer(height: 14, width: 100)),
              ],
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 4.w,
              runSpacing: 4.h,
              children: List.generate(
                4,
                (index) =>
                    StrandedShimmer(height: 18.h, width: 50.w, borderRadius: 4),
              ),
            ),
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
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor.withOpacity(0.25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                StrandedShimmer(height: 40, width: 40, borderRadius: 10),
                SizedBox(width: 12),
                Expanded(
                  child: StrandedShimmer(height: 16, width: double.infinity),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                5,
                (index) => const StrandedShimmer(
                  height: 24,
                  width: 70,
                  borderRadius: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
