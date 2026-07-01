import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 170.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImages.homeBenner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
        border: Border(
          bottom: BorderSide(
            width: 1.w,
            color: AppColors.initColors().primaryColor,
          ),
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
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.kFontSize14,
                      //height: AppDimensions.kLineHeight14(18),
                      //letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().textBlackColor1,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'I’m DMP Dissanayake \n'),
                      TextSpan(
                        text: 'Flutter Mobile',
                        style: TextStyle(
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                      const TextSpan(text: ' Developer'),
                    ],
                  ),
                ),
                //SizedBox(height: 8.h),
                Lottie.asset(AppImages.mADevelopment, height: 70.h),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: AppColors.initColors().nonChangeBlack.withOpacity(
                    0.15,
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                'https://drive.google.com/uc?export=view&id=1II6ejrixHINsooflYoj9ywSikM-kL0XZ',
                height: 90.h,
                width: 90.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
