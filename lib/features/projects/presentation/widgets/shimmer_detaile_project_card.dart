import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerDetaileProjectCard extends StatelessWidget {
  const ShimmerDetaileProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
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
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: StrandedShimmer(height: 16, width: 200),
                    ),
                    SizedBox(width: 8.w),
                    StrandedShimmer(
                      height: 24.h,
                      width: 80.w,
                      borderRadius: 12.r,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                const StrandedShimmer(height: 12, width: double.infinity),
                SizedBox(height: 4.h),
                const StrandedShimmer(height: 12, width: 250),
                SizedBox(height: 12.h),
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
                SizedBox(height: 6.h),
                Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  children: List.generate(
                    4,
                    (index) => StrandedShimmer(
                      height: 20.h,
                      width: 70.w,
                      borderRadius: 4.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Divider(color: AppColors.initColors().primaryColor, thickness: 1),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                const StrandedShimmer(height: 24, width: 80, borderRadius: 6),
                SizedBox(width: 24.w),
                const StrandedShimmer(height: 24, width: 80, borderRadius: 6),
              ],
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
