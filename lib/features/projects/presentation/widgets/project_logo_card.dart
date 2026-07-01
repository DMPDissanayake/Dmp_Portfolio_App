import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProjectLogoCard extends StatelessWidget {
  final Color color;
  final String logo;
  const ProjectLogoCard({super.key, required this.color, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          logo,
          color: AppColors.initColors().nonChangeWhite,
          height: 18.h,
        ),
      ),
    );
  }
}
