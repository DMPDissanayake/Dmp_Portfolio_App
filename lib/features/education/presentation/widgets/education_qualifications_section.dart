import 'package:dmpportfolioapp/features/education/domain/entities/education_entity.dart';
import 'package:dmpportfolioapp/features/education/presentation/widgets/eduaction_detaile_card.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EaduationSection extends StatelessWidget {
  final List<EducationEntity> data;
  const EaduationSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final eduaction = data[index];
          final isFirst = index == 0;
          final isLast = index == data.length - 1;

          // IntrinsicHeight ensures the timeline line stretches exactly to the card height
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left timeline icon & line column
                SizedBox(
                  width: 40.w, // Fixed width for timeline tracks
                  child: Column(
                    children: [
                      // Icon Node circle indicator
                      Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          color: isFirst
                              ? AppColors.initColors().primaryColor
                              : AppColors.initColors().nonChangeWhite,
                          shape: BoxShape
                              .circle, // Use circle for a pixel perfect indicator
                          border: Border.all(
                            width: 2,
                            color: AppColors.initColors().primaryColor
                                .withOpacity(0.2),
                          ),
                        ),
                        child: SvgPicture.asset(
                          isFirst
                              ? AppImages.svgUniversity
                              : AppImages.svgCertification,
                          height: 24.h,
                          width: 24.h,
                          colorFilter: ColorFilter.mode(
                            isFirst
                                ? AppColors.initColors().nonChangeWhite
                                : AppColors.initColors().primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      // Timeline Connecting Line
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2.w,
                            color: AppColors.initColors().primaryColor
                                .withOpacity(0.5),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),

                // Right content side card wrapped in Expanded to prevent layout overflows
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: EduactionDetaileCard(data: eduaction),
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
