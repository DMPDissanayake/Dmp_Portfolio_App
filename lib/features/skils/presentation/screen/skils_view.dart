import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_bloc.dart';
import 'package:dmpportfolioapp/shared/common/custom_segmented_control_widget.dart';
import 'package:dmpportfolioapp/shared/common/custom_tab_bar_widget.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkilsView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const SkilsView({super.key, required this.onChangeTab, this.data});

  @override
  State<SkilsView> createState() => _SkilsViewState();
}

class _SkilsViewState extends State<SkilsView> {
  final SkilsBloc _bloc = SkilsBloc();
  int activeTabId = 1;
  int _selectedIndex = 0;

  final List<TabTata> myTabs = [
    TabTata(id: 1, name: "Skills"),
    TabTata(id: 2, name: "Experience"),
  ];
  final List<String> _tabs = [
    "Technical Skills",
    "Professional Skills",
    "Achievements",
    "Learning",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: BlocProvider.value(
            value: _bloc,
            child: BlocListener<SkilsBloc, SkilsState>(
              listener: (_, state) {},
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomSegmentedControl(
                      tabs: myTabs,
                      selectedId: activeTabId,
                      onTabSelected: (selectedTab) {
                        setState(() {
                          activeTabId = selectedTab.id;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Technical Skills Section
                  if (activeTabId == 1)
                    Expanded(
                      child: Column(
                        children: [
                          CustomTabBar(
                            tabs: _tabs,
                            selectedIndex: _selectedIndex,
                            onTabSelected: (index) {
                              setState(() => _selectedIndex = index);
                            },
                          ),
                          SizedBox(height: 16.h),
                          if (_selectedIndex == 0)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Technical Skills',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.kFontSize14,
                                      height: AppDimensions.kLineHeight14(18),
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color: AppColors.initColors()
                                          .textBlackColor1,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                ],
                              ),
                            ),
                          if (_selectedIndex == 1)
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Professional Skills',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.kFontSize14,
                                      height: AppDimensions.kLineHeight14(18),
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color: AppColors.initColors()
                                          .textBlackColor1,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                ],
                              ),
                            ),
                          if (_selectedIndex == 2)
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Achievements',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.kFontSize14,
                                      height: AppDimensions.kLineHeight14(18),
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color: AppColors.initColors()
                                          .textBlackColor1,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                ],
                              ),
                            ),
                          if (_selectedIndex == 3)
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Learning',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.kFontSize14,
                                      height: AppDimensions.kLineHeight14(18),
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color: AppColors.initColors()
                                          .textBlackColor1,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),

                  if (activeTabId == 2)
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Experience',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AppDimensions.kFontSize14,
                              height: AppDimensions.kLineHeight14(18),
                              letterSpacing: AppDimensions.kLetterSpacing14(
                                -2.5,
                              ),
                              color: AppColors.initColors().textBlackColor1,
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
