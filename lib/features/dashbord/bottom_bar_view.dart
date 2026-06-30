import 'package:dmpportfolioapp/features/about/presentation/screen/about_view.dart';
import 'package:dmpportfolioapp/features/dashbord/widget/bottom_bar_item.dart';
import 'package:dmpportfolioapp/features/education/presentation/screen/eduaction_view.dart';
import 'package:dmpportfolioapp/features/home/presentation/screen/home_view.dart';
import 'package:dmpportfolioapp/features/projects/presentation/screen/project_view.dart';
import 'package:dmpportfolioapp/features/skils/presentation/screen/skils_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart'; // 👈 මේක ඇතුලත් කරන්න
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
    // 1. දැනට තියෙන්නේ Mobile ද නැද්ද කියලා check කරගන්නවා
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
        // 2. Mobile නෙමෙයි නම් (Tablet/Desktop) Side Menu එකත් එක්ක Row එකක් ඇතුලේ Body එක දානවා
        body: SafeArea(
          child: isMobile
              ? Stack(children: [_getBody()]) // Mobile Layout
              : Row(
                  children: [
                    _buildSideMenu(), // 👈 Desktop/Tablet වලදී වම් පැත්තේ පෙනෙන Side Menu එක
                    const VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ), // පොඩි separation එකක් සඳහා
                    Expanded(child: Stack(children: [_getBody()])),
                  ],
                ),
        ),
        // 3. Mobile වලදී විතරක් Bottom Navigation Bar එක පෙන්වනවා
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

  // --- Mobile Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, 0),
            blurRadius: 24,
            spreadRadius: 0,
            color: Color(0x3D000000),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getNavItems(),
      ),
    );
  }

  // --- Web / Desktop Side Menu ---
  Widget _buildSideMenu() {
    return Container(
      width: 250.w, // Side menu එකට ගැලපෙන පළලක් (Width) මෙතනින් දෙන්න
      color: AppColors.initColors().nonChangeWhite,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Logo එක හෝ Title එක මෙතනට දාන්න පුළුවන්
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Text(
              "Portfolio",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30.h),
          // Navigation Items ටික Column එකක් ඇතුලේ සිරස්ව (Vertically) පෙන්වනවා
          ..._getNavItems().map(
            (item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: item,
            ),
          ),
        ],
      ),
    );
  }

  // Navigation Items ටික කෝඩ් එක double නොවෙන්න එක තැනකට ගත්තා
  List<Widget> _getNavItems() {
    return [
      BottomBarItem(
        name: 'Home',
        selectedIcon: AppImages.svgHome,
        onTap: () => changeTab(0),
        isSelected: selectedTab == 0,
      ),
      BottomBarItem(
        name: 'Courses',
        selectedIcon: AppImages.svgSkills,
        onTap: () => changeTab(1),
        isSelected: selectedTab == 1,
      ),
      BottomBarItem(
        name: 'Grades',
        selectedIcon: AppImages.svgProject,
        onTap: () => changeTab(2),
        isSelected: selectedTab == 2,
      ),
      BottomBarItem(
        name: 'Profile',
        selectedIcon: AppImages.svgEducation,
        onTap: () => changeTab(3),
        isSelected: selectedTab == 3,
      ),
      BottomBarItem(
        name: 'About', // කලින් 'Profile' කියලා දෙපාරක් තිබ්බ නිසා 'About' කලා
        selectedIcon: AppImages.svgProfile,
        onTap: () => changeTab(4),
        isSelected: selectedTab == 4,
      ),
    ];
  }

  Widget _getBody() {
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
