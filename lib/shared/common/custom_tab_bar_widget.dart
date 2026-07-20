import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomTabBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final List<String> tabs;
  final int orderCount;
  final int savedOrderCount;

  CustomTabBar({
    Key? key,
    this.orderCount = 0,
    this.savedOrderCount = 0,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.tabs,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  bool _isSearch = false;

  // Tab bar selection animation
  late AnimationController _tabController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // Search bar open/close animation
  late AnimationController _searchController;
  late Animation<double> _tabFadeAnimation;
  late Animation<double> _tabSlideAnimation;

  // Tracks which unselected tab is hovered (web only)
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();

    _tabController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _tabController, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _tabController, curve: Curves.easeInOut));

    _tabController.forward();

    _searchController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _tabFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _searchController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _tabSlideAnimation = Tween<double>(begin: 0.0, end: -30.0).animate(
      CurvedAnimation(parent: _searchController, curve: Curves.easeInCubic),
    );
  }

  @override
  void didUpdateWidget(covariant CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile ? _buildMobile() : _buildWeb();
  }

  // ---------------------------------------------------------------------
  // MOBILE (unchanged)
  // ---------------------------------------------------------------------
  Widget _buildMobile() {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _searchController,
          builder: (context, child) {
            return Opacity(
              opacity: _tabFadeAnimation.value,
              child: Transform.translate(
                offset: Offset(_tabSlideAnimation.value, 0),
                child: IgnorePointer(ignoring: _isSearch, child: child),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: AppColors.initColors().primaryColor,
                      borderRadius: BorderRadius.circular(360.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(widget.tabs.length, (index) {
                        final isSelected = widget.selectedIndex == index;

                        return GestureDetector(
                          onTap: () => widget.onTabSelected(index),
                          child: AnimatedBuilder(
                            animation: _tabController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: isSelected ? _scaleAnimation.value : 1.0,
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 58.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isSelected ? 11.5.w : 8.w,
                                    vertical: 7.h,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? AppColors.initColors().tabBarColor
                                        : null,
                                    color: isSelected
                                        ? null
                                        : AppColors.initColors().primaryColor,
                                    borderRadius: BorderRadius.circular(360.r),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.08 * _opacityAnimation.value,
                                              ),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.tabs[index],
                                      style: TextStyle(
                                        fontSize: AppDimensions.kFontSize11,
                                        fontWeight: isSelected
                                            ? FontWeight.w800
                                            : FontWeight.w400,
                                        color: isSelected
                                            ? AppColors.initColors()
                                                  .primaryColor
                                            : AppColors.initColors()
                                                  .nonChangeWhite,
                                        letterSpacing:
                                            AppDimensions.kLetterSpacing14(
                                              -2.5,
                                            ),
                                        height: AppDimensions.kLineHeight14(22),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // WEB / DESKTOP — evenly spaced pill tabs with hover states
  // ---------------------------------------------------------------------
  Widget _buildWeb() {
    return AnimatedBuilder(
      animation: _searchController,
      builder: (context, child) {
        return Opacity(
          opacity: _tabFadeAnimation.value,
          child: Transform.translate(
            offset: Offset(_tabSlideAnimation.value, 0),
            child: IgnorePointer(ignoring: _isSearch, child: child),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.initColors().primaryColor,
          borderRadius: BorderRadius.circular(360),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = widget.selectedIndex == index;
            final isHovered = _hoveredIndex == index;

            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = null),
              child: GestureDetector(
                onTap: () => widget.onTabSelected(index),
                child: AnimatedBuilder(
                  animation: _tabController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: isSelected ? _scaleAnimation.value : 1.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        constraints: const BoxConstraints(minWidth: 90),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 20 : 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? AppColors.initColors().tabBarColor
                              : null,
                          color: isSelected
                              ? null
                              : (isHovered
                                    ? AppColors.initColors().nonChangeWhite
                                          .withOpacity(0.12)
                                    : Colors.transparent),
                          borderRadius: BorderRadius.circular(360),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                      0.08 * _opacityAnimation.value,
                                    ),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Center(
                          child: Text(
                            widget.tabs[index],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w800
                                  : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.initColors().primaryColor
                                  : AppColors.initColors().nonChangeWhite,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
