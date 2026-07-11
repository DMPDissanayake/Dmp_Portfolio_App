import 'package:dmpportfolioapp/features/skils/domain/entities/skil_entity.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressTimelineItem {
  final IconData icon;
  final String title;
  final String description;
  final String tagText;
  final double
  progress; // Value between 0.0 and 1.0 for the outer indicator ring

  ProgressTimelineItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.tagText,
    required this.progress,
  });
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  const DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 4, dashSpace = 4, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ProgressTimeline extends StatelessWidget {
  final List<LearningRoadmapEntity> items;
  final Color primaryColor;

  ProgressTimeline({super.key, required this.items, Color? primaryColor})
    : primaryColor = primaryColor ?? AppColors.initColors().primaryColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isLast = index == items.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left side: Progress Circular Icon + Dashed Line
              SizedBox(
                width: 50.w,
                child: Column(
                  children: [
                    // Circular Progress Icon Container
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: CircularProgressIndicator(
                            value: item.progress,
                            strokeWidth: 3,
                            backgroundColor: primaryColor.withOpacity(0.15),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              primaryColor,
                            ),
                          ),
                        ),
                        Icon(Icons.check, color: primaryColor, size: 18.h),
                      ],
                    ),
                    // Dashed Vertical Connector
                    if (!isLast)
                      Expanded(
                        child: CustomPaint(
                          size: Size(2.w, double.infinity),
                          painter: DashedLinePainter(
                            color: primaryColor.withOpacity(0.6),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),

              // Right side: Content Data Block
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.kFontSize12,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().textBlackColor1,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimensions.kFontSize11,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().textBlackColor1
                              .withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Status Badge Tag
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: primaryColor.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          item.status,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimensions.kFontSize12,
                            height: AppDimensions.kLineHeight14(18),
                            letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                            color: AppColors.initColors().primaryColor,
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
    );
  }
}
