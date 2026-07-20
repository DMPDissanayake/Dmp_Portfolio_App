import 'package:dmpportfolioapp/core/di/injection_container.dart';
import 'package:dmpportfolioapp/features/skils/domain/entities/experience_entity.dart';
import 'package:dmpportfolioapp/features/skils/domain/entities/skil_entity.dart';
import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_bloc.dart';
import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_event.dart';
import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_state.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/currently_mastering_crad.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/experience_section.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/key_awards_section.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/shimmer_experience_section.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/progress_timeline.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/quick_metrics_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/title_skil_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/professional_skills_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/shimmer_professional_skills_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/shimmer_techical_skills_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/techical_skills_card.dart';
import 'package:dmpportfolioapp/shared/common/custom_segmented_control_widget.dart';
import 'package:dmpportfolioapp/shared/common/custom_tab_bar_widget.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkilsView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const SkilsView({super.key, required this.onChangeTab, this.data});

  @override
  State<SkilsView> createState() => _SkilsViewState();
}

class _SkilsViewState extends State<SkilsView> {
  final SkilsBloc _bloc = sl<SkilsBloc>();
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

  bool _isLoading = false;
  String? _errorMessage;

  List<SkilEntity> _techicalSkillsList = [];
  List<SkilEntity> _professionalSkillsList = [];
  SkilEntity? _achievements;
  SkilEntity? _learning;

  List<ExperienceEntity> _experienceList = [];

  @override
  void initState() {
    if (activeTabId == 1) {
      _bloc.add(FetchSkilsData());
    } else if (activeTabId == 2) {
      _bloc.add(FetchExperienceData());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
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
              listener: (_, state) {
                if (state is SkilsLoading) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                } else if (state is SkilsLoaded) {
                  setState(() {
                    _isLoading = false;
                    //technical
                    _techicalSkillsList = state.skilsList
                        .where((skill) => skill.category == 'technical')
                        .toList();
                    //professional
                    _professionalSkillsList = state.skilsList
                        .where((skill) => skill.category == 'professional')
                        .toList();
                    //achievements
                    _achievements = state.skilsList
                        .where((skill) => skill.category == 'achievement')
                        .firstOrNull;
                    //learning
                    _learning = state.skilsList
                        .where((skill) => skill.category == 'learning')
                        .firstOrNull;
                  });
                } else if (state is ExperienceLoaded) {
                  setState(() {
                    _isLoading = false;
                    _experienceList = state.experienceList;
                  });
                } else if (state is SkilsError) {
                  setState(() {
                    _isLoading = false;
                    _errorMessage = state.message;
                  });
                }
              },
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
                          if (activeTabId == 1 && _techicalSkillsList.isEmpty) {
                            _bloc.add(FetchSkilsData());
                          } else if (activeTabId == 2 &&
                              _experienceList.isEmpty) {
                            _bloc.add(FetchExperienceData());
                          }
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
                              child: _isLoading
                                  ? GridView.builder(
                                      itemCount: 6,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 16.h,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.w,
                                            mainAxisSpacing: 12.h,
                                            childAspectRatio: 1.2,
                                          ),
                                      itemBuilder: (context, index) =>
                                          const ShimmerTechicalSkillsCard(),
                                    )
                                  : GridView.builder(
                                      itemCount: _techicalSkillsList.length,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 16.h,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.w,
                                            mainAxisSpacing: 12.h,
                                            childAspectRatio: isMobile ? 1 : 5,
                                          ),
                                      itemBuilder: (context, index) =>
                                          TechicalSkillsCard(
                                            data: _techicalSkillsList[index],
                                          ),
                                    ),
                            ),
                          if (_selectedIndex == 1)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: const ProfesinalTitleSkilCard(
                                      title: 'Professional Skills',
                                      subtitle:
                                          'A snapshot of the strengths I bring to every team',
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Expanded(
                                    child: _isLoading
                                        ? GridView.builder(
                                            itemCount: 6,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                              vertical: 16.h,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 12.w,
                                                  mainAxisSpacing: 12.h,
                                                  childAspectRatio: 0.8,
                                                ),
                                            itemBuilder: (context, index) =>
                                                const ShimmerProfessionalSkillsCard(),
                                          )
                                        : GridView.builder(
                                            itemCount:
                                                _professionalSkillsList.length,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                              vertical: 16.h,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 12.w,
                                                  mainAxisSpacing: 12.h,
                                                  childAspectRatio: 1.8,
                                                ),
                                            itemBuilder: (context, index) {
                                              final skill =
                                                  _professionalSkillsList[index];
                                              return ProfessionalSkillsCard(
                                                skill: skill.items![index],
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          if (_selectedIndex == 2)
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 16.h),
                                      const ProfesinalTitleSkilCard(
                                        title: 'Achievements & Highlights',
                                        subtitle:
                                            'Milestones, projects, and recognition along the way.',
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'Quick Metrics',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppDimensions.kFontSize14,
                                          height: AppDimensions.kLineHeight14(
                                            18,
                                          ),
                                          letterSpacing:
                                              AppDimensions.kLetterSpacing14(
                                                -2.5,
                                              ),
                                          color: AppColors.initColors()
                                              .textBlackColor1,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count:
                                                  _achievements
                                                      ?.metrics?['years_learning'] ??
                                                  "0",
                                              title: 'Years Learning Flutter',
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count:
                                                  _achievements
                                                      ?.metrics?['projects_completed'] ??
                                                  "0",
                                              title: 'Projects Completed',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count:
                                                  _achievements
                                                      ?.metrics?['technologies_used'] ??
                                                  '0',
                                              title: 'Technologies Used',
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count:
                                                  _achievements
                                                      ?.metrics?['git_commits'] ??
                                                  '0',
                                              title: 'Git Commits',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      SizedBox(
                                        height: 300.h, // Constrain the height
                                        child: MilestoneTimeline(
                                          title: "Key Awards & Milestones",
                                          items:
                                              (_achievements?.milestones ?? [])
                                                  .map((m) {
                                                    return MilestoneItem(
                                                      years: m.years,
                                                      description:
                                                          m.description,
                                                    );
                                                  })
                                                  .toList(),
                                          primaryColor: AppColors.initColors()
                                              .primaryColor, // Adjust tone match your exact UI hex
                                        ),
                                      ),
                                      SizedBox(height: 32.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_selectedIndex == 3)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProfesinalTitleSkilCard(
                                        title: 'Learning & Continuous Growth',
                                        subtitle:
                                            'A clear trajectory of professional development.',
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(
                                        'Currently Mastering',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppDimensions.kFontSize14,
                                          height: AppDimensions.kLineHeight14(
                                            18,
                                          ),
                                          letterSpacing:
                                              AppDimensions.kLetterSpacing14(
                                                -2.5,
                                              ),
                                          color: AppColors.initColors()
                                              .textBlackColor1,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      CurrentlyMasteringCrad(
                                        icon: AppImages.svgAI,
                                        title: 'AI Integration',
                                        description:
                                            'Bringing intelligence into every experience',
                                      ),
                                      SizedBox(height: 16.h),
                                      Divider(
                                        color: AppColors.initColors()
                                            .primaryColor
                                            .withOpacity(0.7),
                                        height: 1.h,
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'Learning Roadmap',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppDimensions.kFontSize14,
                                          height: AppDimensions.kLineHeight14(
                                            18,
                                          ),
                                          letterSpacing:
                                              AppDimensions.kLetterSpacing14(
                                                -2.5,
                                              ),
                                          color: AppColors.initColors()
                                              .textBlackColor1,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      SingleChildScrollView(
                                        child: ProgressTimeline(
                                          items:
                                              _learning?.learningRoadmap ?? [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                  if (activeTabId == 2)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const ProfesinalTitleSkilCard(
                                title: 'Work Experience',
                                subtitle:
                                    'Building reliable Flutter apps, end to end.',
                              ),
                              SizedBox(height: 24.h),
                              _isLoading
                                  ? const ShimmerExperienceSection()
                                  : ExperienceSection(
                                      experiences: _experienceList,
                                    ),
                            ],
                          ),
                        ),
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
