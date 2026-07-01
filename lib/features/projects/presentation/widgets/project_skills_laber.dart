import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectSkillsLaber extends StatelessWidget {
  final Color color;
  final String label;
  const ProjectSkillsLaber({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: AppDimensions.kFontSize10,
          height: AppDimensions.kLineHeight14(14),
          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
          color: color,
        ),
      ),
    );
  }
}
