import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PremiumSkillLineChart extends StatefulWidget {
  final List<SkillData> skills;
  final Color? lineColor;
  final List<Color>? gradientColors;

  const PremiumSkillLineChart({
    super.key,
    required this.skills,
    this.lineColor,
    this.gradientColors,
  });

  @override
  State<PremiumSkillLineChart> createState() => _PremiumSkillLineChartState();
}

class _PremiumSkillLineChartState extends State<PremiumSkillLineChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    // Reduced duration from 5000ms to 1500ms for a much punchier web experience
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.initColors().primaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
            offset: const Offset(4, 0),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 12.w, right: 24.w, top: 16.h),
      child: VisibilityDetector(
        key: const Key('skills-line-chart-key'),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction > 0.3 && !_hasAnimated) {
            _animationController.forward();
            setState(() {
              _hasAnimated = true;
            });
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox(height: 150.h, child: LineChart(mainData()));
          },
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.initColors().nonChangeBlack.withOpacity(
            0.05,
          ), // Fixed grid visibility color
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 60.h,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40.w,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      // Crucial Fix: Padding added to minX and maxX boundaries so the first and last dots/titles are not clipped
      minX: 0,
      maxX: widget.skills.length.toDouble() - 1,
      minY: 0,
      maxY: 100,
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => const Color(0xff0f172a),
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final skill = widget.skills[barSpot.x.toInt()];
              return LineTooltipItem(
                '${skill.name}: ${skill.percentage.toInt()}%',
                TextStyle(
                  color: AppColors.initColors().nonChangeWhite,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: widget.skills.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value.percentage;
            // Clean animation calculation starting dynamically from baseline 0
            double animatedValue = value * _animation.value;
            return FlSpot(index.toDouble(), animatedValue);
          }).toList(),
          isCurved: true,
          curveSmoothness:
              0.2, // Lowered curve smoothness slightly to prevent clipping out of maximum boundaries
          color: widget.lineColor ?? AppColors.initColors().primaryColor,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
                  radius: 6,
                  color:
                      widget.lineColor ?? AppColors.initColors().primaryColor,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors:
                  widget.gradientColors ??
                  [
                    (widget.lineColor ?? AppColors.initColors().primaryColor)
                        .withOpacity(0.4),
                    (widget.lineColor ?? AppColors.initColors().primaryColor)
                        .withOpacity(0.0),
                  ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.initColors().textBlackColor1.withOpacity(0.6),
      fontWeight: FontWeight.w500,
      fontSize: 11.sp,
    );

    // Prevent duplicate titles by only drawing for integer values
    if (value != value.roundToDouble()) {
      return Container();
    }

    int index = value.toInt();
    if (index >= 0 && index < widget.skills.length) {
      return SideTitleWidget(
        meta: meta,
        space: 8,
        // Rotated via Transform widget wrapper inside a sized boundary block
        child: Transform.rotate(
          angle:
              -math.pi /
              4, // 45-degree angle saves massive vertical room compared to 90 degrees
          child: Text(
            widget.skills[index].name,
            style: style,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return Container();
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff64748b), fontSize: 12);
    return SideTitleWidget(
      meta: meta,
      space: 10,
      child: Text('${value.toInt()}%', style: style),
    );
  }
}
