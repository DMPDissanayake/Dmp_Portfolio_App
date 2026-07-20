import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobileChart() : _buildWebChart();
  }

  // ---------------------------------------------------------------------
  // MOBILE (unchanged)
  // ---------------------------------------------------------------------
  Widget _buildMobileChart() {
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
        onVisibilityChanged: _onVisibilityChanged,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox(
              height: 150.h,
              child: LineChart(mainData(rotateLabels: true)),
            );
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // WEB / DESKTOP — chart with header, legend and stat highlights
  // ---------------------------------------------------------------------
  Widget _buildWebChart() {
    final primary = widget.lineColor ?? AppColors.initColors().primaryColor;
    final topSkill = widget.skills.isEmpty
        ? null
        : widget.skills.reduce((a, b) => a.percentage >= b.percentage ? a : b);
    final average = widget.skills.isEmpty
        ? 0.0
        : widget.skills.map((s) => s.percentage).reduce((a, b) => a + b) /
              widget.skills.length;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.initColors().primaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.initColors().nonChangeBlack.withOpacity(0.08),
            offset: const Offset(0, 6),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(28, 24, 32, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skill Proficiency',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.initColors().textBlackColor1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'A snapshot of my confidence across core technologies',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.initColors().textBlackColor1
                            .withOpacity(0.55),
                      ),
                    ),
                  ],
                ),
              ),
              if (topSkill != null) ...[
                _StatPill(
                  label: 'Top skill',
                  value: topSkill.name,
                  color: primary,
                ),
                const SizedBox(width: 10),
                _StatPill(
                  label: 'Average',
                  value: '${average.toStringAsFixed(0)}%',
                  color: primary,
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          VisibilityDetector(
            key: const Key('skills-line-chart-key-web'),
            onVisibilityChanged: _onVisibilityChanged,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  height: 260,
                  child: LineChart(mainData(rotateLabels: false)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onVisibilityChanged(VisibilityInfo visibilityInfo) {
    if (visibilityInfo.visibleFraction > 0.3 && !_hasAnimated) {
      _animationController.forward();
      setState(() {
        _hasAnimated = true;
      });
    }
  }

  LineChartData mainData({required bool rotateLabels}) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.initColors().nonChangeBlack.withOpacity(0.05),
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
            reservedSize: rotateLabels ? 60.h : 36,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, rotateLabels),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: rotateLabels ? 40.w : 40,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
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
            double animatedValue = value * _animation.value;
            return FlSpot(index.toDouble(), animatedValue);
          }).toList(),
          isCurved: true,
          curveSmoothness: 0.2,
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

  Widget bottomTitleWidgets(double value, TitleMeta meta, bool rotateLabels) {
    final style = TextStyle(
      color: AppColors.initColors().textBlackColor1.withOpacity(0.6),
      fontWeight: FontWeight.w500,
      fontSize: rotateLabels ? 11.sp : 12,
    );

    if (value != value.roundToDouble()) {
      return Container();
    }

    int index = value.toInt();
    if (index < 0 || index >= widget.skills.length) return Container();

    // Web has more horizontal room, so labels stay flat and readable.
    if (!rotateLabels) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text(
          widget.skills[index].name,
          style: style,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: -math.pi / -10,
      space: 8,
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Text(
          widget.skills[index].name,
          style: style,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff64748b), fontSize: 12);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text('${value.toInt()}%', style: style),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatPill({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
