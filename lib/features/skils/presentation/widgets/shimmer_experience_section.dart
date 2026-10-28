import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerExperienceSection extends StatelessWidget {
  const ShimmerExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(2, (index) => _buildShimmerCard()));
  }

  Widget _buildShimmerCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StrandedShimmer(
                        height: 16,
                        width: 200,
                      ), // Job Title
                      SizedBox(height: 4.h),
                      const StrandedShimmer(height: 12, width: 150), // Company
                    ],
                  ),
                  StrandedShimmer(
                    height: 24.h,
                    width: 60.w,
                    borderRadius: 12.r,
                  ), // Current tag
                ],
              ),
              SizedBox(height: 2.h),
              const StrandedShimmer(height: 10, width: 120), // Duration
              SizedBox(height: 12.h),
              const StrandedShimmer(
                height: 12,
                width: double.infinity,
              ), // Description line 1
              SizedBox(height: 4.h),
              const StrandedShimmer(
                height: 12,
                width: double.infinity,
              ), // Description line 2
              SizedBox(height: 4.h),
              const StrandedShimmer(
                height: 12,
                width: 250,
              ), // Description line 3
              SizedBox(height: 12.h),
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
      ),
    );
  }
}
