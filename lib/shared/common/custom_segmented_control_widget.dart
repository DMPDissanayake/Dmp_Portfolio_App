import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTata {
  final int id;
  final String name;

  TabTata({required this.id, required this.name});
}

class CustomSegmentedControl extends StatefulWidget {
  final int
  selectedId; // Track by ID instead of index for better data integrity
  final List<TabTata> tabs;
  final Function(TabTata) onTabSelected;

  const CustomSegmentedControl({
    super.key,
    required this.selectedId,
    required this.tabs,
    required this.onTabSelected,
  });

  @override
  State<CustomSegmentedControl> createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CustomSegmentedControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedId != oldWidget.selectedId) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: widget.tabs.map((tab) {
          final bool isSelected = widget.selectedId == tab.id;

          // 1. Build the base container for the tab
          Widget tabContent = AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: isSelected ? AppColors.initColors().tabBarColor : null,
              color: isSelected ? null : AppColors.initColors().primaryColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.initColors().nonChangeBlack
                            .withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              tab.name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppDimensions.kFontSize14,
                height: AppDimensions.kLineHeight14(20),
                letterSpacing: AppDimensions.kLetterSpacing14(0),
                color: isSelected
                    ? AppColors.initColors().primaryColor
                    : AppColors.initColors().nonChangeWhite,
              ),
            ),
          );

          // 2. ONLY wrap with the scale animation builder if the tab is selected
          if (isSelected) {
            tabContent = AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: tabContent,
            );
          }

          return Expanded(
            child: GestureDetector(
              onTap: () => widget.onTabSelected(tab),
              child: tabContent,
            ),
          );
        }).toList(),
      ),
    );
  }
}
