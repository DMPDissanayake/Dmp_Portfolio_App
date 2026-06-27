import 'package:dmpportfolioapp/features/about/presentation/screen/about_view.dart';
import 'package:dmpportfolioapp/features/dashbord/widget/bottom_bar_item.dart';
import 'package:dmpportfolioapp/features/education/presentation/screen/eduaction_view.dart';
import 'package:dmpportfolioapp/features/home/presentation/screen/home_view.dart';
import 'package:dmpportfolioapp/features/projects/presentation/screen/project_view.dart';
import 'package:dmpportfolioapp/features/skils/presentation/screen/skils_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: SafeArea(child: Stack(children: [_getBody()])),
        bottomNavigationBar: Container(
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
            children: [
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
                name: 'Profile',
                selectedIcon: AppImages.svgProfile,
                onTap: () => changeTab(4),
                isSelected: selectedTab == 4,
              ),
            ],
          ),
        ),
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
