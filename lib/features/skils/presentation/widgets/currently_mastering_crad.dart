import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CurrentlyMasteringCrad extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const CurrentlyMasteringCrad({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 2,
          color: AppColors.initColors().primaryColor.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
            offset: Offset(4, 0),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.initColors().nonChangeWhite.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 1,
                  color: AppColors.initColors().nonChangeWhite.withOpacity(0.6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.initColors().nonChangeBlack.withOpacity(
                      0.12,
                    ),
                    offset: Offset(4, 0),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: SvgPicture.asset(
                  icon,
                  height: 22.h,
                  color: AppColors.initColors().nonChangeWhite.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimensions.kFontSize12,
                      height: AppDimensions.kLineHeight14(18),
                      letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().textBlackColor1,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.kFontSize11,
                      height: AppDimensions.kLineHeight14(18),
                      letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().textBlackColor1.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
