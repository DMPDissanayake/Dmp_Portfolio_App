import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectCardShimmer extends StatelessWidget {
  const ProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileShimmer(context) : _buildWebShimmer(context);
  }

  Widget _buildMobileShimmer(BuildContext context) {
    return Container(
      width: 160.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.initColors().primaryColor.withOpacity(0.3),
        ),
        color: AppColors.initColors().nonChangeWhite,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StrandedShimmer(height: 90.h, width: double.infinity),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Row(
                  children: [
                    StrandedShimmer(height: 24.r, width: 24.r, borderRadius: 6),
                    SizedBox(width: 4.w),
                    const Expanded(
                      child: StrandedShimmer(
                        height: 14,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                const StrandedShimmer(height: 12, width: double.infinity),
                SizedBox(height: 4.h),
                const StrandedShimmer(height: 12, width: 100),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 4.w,
                  runSpacing: 4.h,
                  children: List.generate(
                    3,
                    (index) => StrandedShimmer(
                      height: 16.h,
                      width: 35.w,
                      borderRadius: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.initColors().primaryColor.withOpacity(0.3),
            thickness: 1.w,
            height: 1.w,
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    StrandedShimmer(height: 14.h, width: 14.h),
                    SizedBox(width: 8.w),
                    StrandedShimmer(height: 14.h, width: 14.h),
                  ],
                ),
                StrandedShimmer(height: 22.h, width: 50.w, borderRadius: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebShimmer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor.withOpacity(0.35),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // තිරයේ පළල කුඩා වූ විට Column එකක් ලෙසද, විශාල වූ විට Row එකක් ලෙසද පෙන්වයි
          bool isCompact = constraints.maxWidth < 500;

          if (isCompact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const StrandedShimmer(
                  width: double.infinity,
                  height: 160,
                  borderRadius: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          StrandedShimmer(
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: StrandedShimmer(
                              height: 18,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const StrandedShimmer(height: 14, width: double.infinity),
                      const SizedBox(height: 6),
                      const StrandedShimmer(height: 14, width: 150),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          3,
                          (index) => const StrandedShimmer(
                            height: 22,
                            width: 60,
                            borderRadius: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Flexible Image Shimmer (විශාල තිර සඳහා fixed 280 වෙනුවට 200/240 ලෙස සකසා ඇත)
                const StrandedShimmer(
                  width: 200,
                  height: double.infinity,
                  borderRadius: 0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Line 110 හි පැවති Row overflow එක විසඳීම
                        Row(
                          children: const [
                            StrandedShimmer(
                              height: 36,
                              width: 36,
                              borderRadius: 8,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: StrandedShimmer(
                                height: 20,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const StrandedShimmer(
                          height: 14,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 6),
                        const StrandedShimmer(height: 14, width: 180),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            4,
                            (index) => const StrandedShimmer(
                              height: 24,
                              width: 65,
                              borderRadius: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
