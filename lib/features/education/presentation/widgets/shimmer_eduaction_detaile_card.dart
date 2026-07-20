import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerEduactionDetaileCard extends StatelessWidget {
  const ShimmerEduactionDetaileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.8),
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
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StrandedShimmer(height: 16, width: 220), // Title
            SizedBox(height: 4.h),
            const StrandedShimmer(height: 14, width: 180), // Institution
            SizedBox(height: 2.h),
            const StrandedShimmer(height: 10, width: 100), // Date Range
            SizedBox(height: 12.h),
            // Bullet points
            ...List.generate(
              2,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StrandedShimmer(height: 12, width: 10),
                    SizedBox(width: 8.w),
                    const Expanded(
                      child: StrandedShimmer(
                        height: 12,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Highlight box
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.initColors().primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border(
                  left: BorderSide(
                    width: 4.w,
                    color: AppColors.initColors().primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  StrandedShimmer(height: 11, width: double.infinity),
                  SizedBox(height: 4),
                  StrandedShimmer(height: 11, width: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
