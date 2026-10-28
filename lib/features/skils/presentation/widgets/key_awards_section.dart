import 'package:dmpportfolioapp/features/skils/domain/entities/skil_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MilestoneItem {
  final List<String> years;
  final String description;

  MilestoneItem({required this.years, required this.description});
}

class MilestoneTimeline extends StatelessWidget {
  final String title;
  final List<MilestoneItem> items;
  final Color primaryColor;

  MilestoneTimeline({
    super.key,
    required this.title,
    required this.items,
    Color? primaryColor,
  }) : primaryColor = primaryColor ?? AppColors.initColors().primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Container(
              width: 5.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize14,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().textBlackColor1,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Timeline List
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final isLast = index == items.length - 1;
            final item = items[index];
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left side: Line and Dot Indicator
                  SizedBox(
                    width: 30.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Vertical Line (hidden for the last item)
                        if (!isLast)
                          Positioned(
                            top: 8.h,
                            bottom: 0,
                            child: Container(width: 2.w, color: primaryColor),
                          ),
                        // Outer Ring/Dot
                        Positioned(
                          top: 4.h,
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              color: AppColors.initColors().nonChangeWhite,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryColor,
                                width: 2.r,
                              ),
                            ),
                            child: Container(
                              width: 6.h,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right side: Content (Tags and Description)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Year Tags Row
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: item.years.map((year) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.w,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  year,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.kFontSize10,
                                    height: AppDimensions.kLineHeight14(18),
                                    letterSpacing:
                                        AppDimensions.kLetterSpacing14(-2.5),
                                    color:
                                        AppColors.initColors().textBlackColor1,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          // Description Text
                          Text(
                            item.description,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.kFontSize12,
                              height: AppDimensions.kLineHeight14(18),
                              letterSpacing: AppDimensions.kLetterSpacing14(
                                -2.5,
                              ),
                              color: AppColors.initColors().textBlackColor1,
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
      ],
    );
  }
}
