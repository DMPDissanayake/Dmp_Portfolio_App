import 'package:dmpportfolioapp/features/education/domain/entities/education_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EduactionDetaileCard extends StatelessWidget {
  final EducationEntity data;
  const EduactionDetaileCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Removed width: double.infinity to let Expanded safely manage layout constraints
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite.withOpacity(0.8),
        borderRadius: BorderRadius.circular(
          16.r,
        ), // Standard matching corner curves
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
            // Row Layout for Header Items
            Text(
              data.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize14,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().textBlackColor1,
              ),
            ),

            Text(
              data.institution,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize12,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                color: AppColors.initColors().primaryColor,
              ),
            ),

            SizedBox(height: 2.h),
            // Period / Date Range duration text
            Text(
              data.dateRange,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppDimensions.kFontSize10,
                height: AppDimensions.kLineHeight14(18),
                letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                fontStyle: FontStyle.italic,
                color: AppColors.initColors().nonChangeBlack.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 12.h),
            // Description Text Block
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.bulletPoints.map((highlight) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize12,
                          height: 1.4,
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          highlight,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimensions.kFontSize11,
                            height: AppDimensions.kLineHeight14(18),
                            letterSpacing: AppDimensions.kLetterSpacing14(1),
                            color: AppColors.initColors().textBlackColor1
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (data.highlightBoxText != null)
              Column(
                children: [
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.initColors().primaryColor.withOpacity(
                        0.3,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border(
                        left: BorderSide(
                          width: 4.w,
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                    ),
                    child: Text(
                      data.highlightBoxText!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.kFontSize11,
                        height: 1.5,
                        color: AppColors.initColors().textBlackColor1
                            .withOpacity(0.9),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
