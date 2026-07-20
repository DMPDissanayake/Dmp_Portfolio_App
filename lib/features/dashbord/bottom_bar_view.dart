import 'package:dmpportfolioapp/features/about/presentation/screen/about_view.dart';
import 'package:dmpportfolioapp/features/dashbord/widget/bottom_bar_item.dart';
import 'package:dmpportfolioapp/features/education/presentation/screen/eduaction_view.dart';
import 'package:dmpportfolioapp/features/home/presentation/screen/home_view.dart';
import 'package:dmpportfolioapp/features/projects/presentation/screen/project_view.dart';
import 'package:dmpportfolioapp/features/skils/presentation/screen/skils_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';

class DashboardView extends StatefulWidget {
  final int? initTab;

  const DashboardView({super.key, this.initTab});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedTab = 0;
  dynamic tabData;

  @override
  void initState() {
    super.initState();
    if (widget.initTab != null) {
      selectedTab = widget.initTab!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return PopScope(
      canPop: selectedTab == 0,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (selectedTab != 0) {
          changeTab(0);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.initColors().whiteBackgroundColor,
        body: SafeArea(
          child: isMobile
              ? Stack(children: [_getNavBody()]) // Mobile Layout
              : Row(
                  children: [
                    _buildSideMenu(), // Web/Desktop side navigation
                    Expanded(child: Stack(children: [_getNavBody()])),
                  ],
                ),
        ),
        bottomNavigationBar: isMobile ? _buildBottomNavigationBar() : null,
      ),
    );
  }

  void changeTab(int value, {dynamic data}) {
    setState(() {
      if (selectedTab != value) {
        selectedTab = value;
        tabData = data;
      }
    });
  }

  // --- Mobile Bottom Navigation Bar (unchanged) ---
  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            spreadRadius: 0,
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getNavItems()
            .map(
              (item) => Expanded(
                child: BottomBarItem(
                  name: item.name,
                  selectedIcon: item.icon,
                  onTap: () => changeTab(item.index),
                  isSelected: selectedTab == item.index,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // --- Web / Desktop Side Menu — narrow icon-only rail ---
  Widget _buildSideMenu() {
    final primary = AppColors.initColors().primaryColor;

    return Container(
      width: 84,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        border: Border(
          right: BorderSide(color: primary.withOpacity(0.10), width: 1),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 36),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: _getNavItems()
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: _SideNavTile(
                        name: item.name,
                        icon: item.icon,
                        isSelected: selectedTab == item.index,
                        onTap: () => changeTab(item.index),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<_NavItemData> _getNavItems() {
    return const [
      _NavItemData(name: 'Home', icon: AppImages.svgHome, index: 0),
      _NavItemData(name: 'Skills', icon: AppImages.svgSkills, index: 1),
      _NavItemData(name: 'Projects', icon: AppImages.svgProject, index: 2),
      _NavItemData(name: 'Education', icon: AppImages.svgEducation, index: 3),
      _NavItemData(name: 'Profile', icon: AppImages.svgProfile, index: 4),
    ];
  }

  Widget _getNavBody() {
    switch (selectedTab) {
      case 0:
        return HomeView(onChangeTab: changeTab, data: tabData);
      case 1:
        return SkilsView(onChangeTab: changeTab, data: tabData);
      case 2:
        return ProjectView(onChangeTab: changeTab, data: tabData);
      case 3:
        return EduactionView(onChangeTab: changeTab, data: tabData);
      case 4:
        return AboutView(onChangeTab: changeTab, data: tabData);
      default:
        return HomeView(onChangeTab: changeTab, data: tabData);
    }
  }
}

class _NavItemData {
  final String name;
  final String icon;
  final int index;
  const _NavItemData({
    required this.name,
    required this.icon,
    required this.index,
  });
}

// ---------------------------------------------------------------------
// Web sidebar tile — icon-only circular button, name shown via tooltip
// ---------------------------------------------------------------------
class _SideNavTile extends StatefulWidget {
  final String name;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SideNavTile({
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_SideNavTile> createState() => _SideNavTileState();
}

class _SideNavTileState extends State<_SideNavTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.initColors().primaryColor;
    final isActive = widget.isSelected;

    return Center(
      child: Tooltip(
        message: widget.name,
        preferBelow: false,
        verticalOffset: 28,
        decoration: BoxDecoration(
          color: AppColors.initColors().textBlackColor1,
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? primary
                    : (_isHovered
                          ? primary.withOpacity(0.10)
                          : Colors.transparent),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: primary.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: SvgPicture.asset(
                  widget.icon,
                  height: 20,
                  width: 20,
                  color: isActive
                      ? Colors.white
                      : AppColors.initColors().textBlackColor1.withOpacity(
                          0.55,
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
