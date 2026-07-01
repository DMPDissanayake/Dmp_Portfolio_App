import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccessCard extends StatefulWidget {
  final String icon;
  final Function onTap;
  final String name;
  const AccessCard({
    super.key,
    required this.icon,
    required this.onTap,
    required this.name,
  });

  @override
  State<AccessCard> createState() => _AccessCardState();
}

class _AccessCardState extends State<AccessCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: 73.h,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 1,
            color: AppColors.initColors().primaryColor,
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
          padding: EdgeInsets.all(4.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.icon,
                fit: BoxFit.cover,
                color: AppColors.initColors().primaryColor,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.initColors().textBlackColor1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
