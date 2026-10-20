import 'package:dmpportfolioapp/core/di/injection_container.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_event.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/home_baner_mobile_shimmer.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/home_banner.dart';
import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/premium_skill_line_chart.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/premium_skill_line_chart_shimmer.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/quick_access_card_shimmer.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/quick_access_card.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_bloc.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_state.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_card.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_card_shimmer.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const HomeView({super.key, required this.onChangeTab, this.data});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<SkillData> mySkills = [
    SkillData(name: 'Flutter', percentage: 80),
    SkillData(name: 'Dart', percentage: 85),
    SkillData(name: 'Clean Architecture', percentage: 80),
    SkillData(name: 'REST API', percentage: 90),
    SkillData(name: 'Git', percentage: 70),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileBloc>(
              create: (context) => sl<ProfileBloc>()..add(FetchProfileData()),
            ),
            BlocProvider<ProjectBloc>(
              create: (context) => sl<ProjectBloc>()..add(FetchProjectData()),
            ),
          ],
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 👤 Profile Header Section
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading) {
                        return Column(
                          children: [
                            const MobileHomeBannerShimmer(),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              // 💡 FIX: Wrap ඇතුළේ Expanded ඉවත් කර ලස්සනට responsive grid එකක් ලෙස සකසා ඇත.
                              child: isMobile
                                  ? Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 8.w,
                                      runSpacing: 8.h,
                                      children: const [
                                        AccessCardShimmer(),
                                        AccessCardShimmer(),
                                        AccessCardShimmer(),
                                        AccessCardShimmer(),
                                      ],
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(child: AccessCardShimmer()),
                                        Expanded(child: AccessCardShimmer()),
                                        Expanded(child: AccessCardShimmer()),
                                        Expanded(child: AccessCardShimmer()),
                                      ],
                                    ),
                            ),
                            SizedBox(height: 8.h),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: PremiumSkillLineChartShimmer(),
                            ),
                          ],
                        );
                      } else if (state is ProfileLoaded) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.onChangeTab(4, data: state.data);
                              },
                              child: HomeBanner(profileEntity: state.data),
                            ),
                            SizedBox(height: 12.h),
                            _buildQuickAccessSection(isMobile),
                            SizedBox(height: 8.h),
                            _buildTechnicalSkillsSection(),
                          ],
                        );
                      } else if (state is ProfileError) {
                        return Center(child: Text(state.message));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 8.h),

                  // 🚀 Featured Projects Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Featured Projects',
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
                        ),
                        InkWell(
                          onTap: () => widget.onChangeTab(2),
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppDimensions.kFontSize12,
                                  height: AppDimensions.kLineHeight14(18),
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
                                  color: AppColors.initColors().primaryColor,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppImages.svgRightArrow,
                                fit: BoxFit.cover,
                                color: AppColors.initColors().primaryColor,
                                width: 18.w,
                                height: 18.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),

                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      final isMobile = ResponsiveBreakpoints.of(
                        context,
                      ).isMobile;
                      if (state is ProjectLoading) {
                        if (isMobile) {
                          return SizedBox(
                            height: 280.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: const ProjectCardShimmer(),
                                );
                              },
                            ),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                ProjectCardShimmer(),
                                ProjectCardShimmer(),
                              ],
                            ),
                          );
                        }
                      } else if (state is ProjectLoaded) {
                        final featuredProjects = state.projectList
                            .take(3)
                            .toList();

                        if (isMobile) {
                          return SizedBox(
                            height: 280.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: featuredProjects.length,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: ProjectCard(
                                    project: featuredProjects[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: featuredProjects.map((project) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: ProjectCard(project: project),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      }
                      return SizedBox(
                        height: 200.h,
                        child: const Center(
                          child: Text("No Projects Available"),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ⚡ Quick Access Section
  Widget _buildQuickAccessSection(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          if (isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'My Skills',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.kFontSize14,
                      height: AppDimensions.kLineHeight14(18),
                      letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().textBlackColor1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => widget.onChangeTab(1),
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.kFontSize12,
                          height: AppDimensions.kLineHeight14(18),
                          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                          color: AppColors.initColors().primaryColor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        AppImages.svgRightArrow,
                        fit: BoxFit.cover,
                        color: AppColors.initColors().primaryColor,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(height: 8.h),
          if (isMobile)
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                AccessCard(
                  name: 'Technical',
                  icon: AppImages.svgTechnical,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Professional',
                  icon: AppImages.svgProfessional,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Achievements',
                  icon: AppImages.svgTrophy,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Learning',
                  icon: AppImages.svgLearning,
                  onTap: () => widget.onChangeTab(1),
                ),
              ],
            ),
          if (!isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AccessCard(
                  name: 'Technical',
                  icon: AppImages.svgTechnical,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Professional',
                  icon: AppImages.svgProfessional,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Achievements',
                  icon: AppImages.svgTrophy,
                  onTap: () => widget.onChangeTab(1),
                ),
                AccessCard(
                  name: 'Learning',
                  icon: AppImages.svgLearning,
                  onTap: () => widget.onChangeTab(1),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // 📊 Technical Skills Chart Section
  Widget _buildTechnicalSkillsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Technical Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppDimensions.kFontSize14,
                    height: AppDimensions.kLineHeight14(18),
                    letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                    color: AppColors.initColors().textBlackColor1,
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.onChangeTab(1),
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.kFontSize12,
                        height: AppDimensions.kLineHeight14(18),
                        letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                        color: AppColors.initColors().primaryColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      AppImages.svgRightArrow,
                      fit: BoxFit.cover,
                      color: AppColors.initColors().primaryColor,
                      width: 18.w,
                      height: 18.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          PremiumSkillLineChart(skills: mySkills),
        ],
      ),
    );
  }
}
