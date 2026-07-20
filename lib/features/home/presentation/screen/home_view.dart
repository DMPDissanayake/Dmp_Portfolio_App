import 'package:dmpportfolioapp/core/di/injection_container.dart'; // 💡 sl එක සඳහා මේක ඇතුළත් කළා
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_event.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/home_banner.dart';
import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/premium_skill_line_chart.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/quick_access_card.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_bloc.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_state.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_card.dart';
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
        // 💡 1.  MultiBlocProvider
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileBloc>(
              create: (context) =>
                  sl<ProfileBloc>()
                    ..add(FetchProfileData()), // 💡 Profile Data load
            ),
            BlocProvider<ProjectBloc>(
              create: (context) =>
                  sl<ProjectBloc>()..add(FetchProjectData()), // 💡 Project Data
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
                      if (state is ProfileLoaded) {
                        return InkWell(
                          onTap: () {
                            widget.onChangeTab(4, data: state.data);
                          },
                          child: HomeBanner(profileEntity: state.data),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 12.h),

                  // ⚡ 2. Quick Access Section
                  Padding(
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
                                    letterSpacing:
                                        AppDimensions.kLetterSpacing14(-2.5),
                                    color:
                                        AppColors.initColors().textBlackColor1,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () =>
                                    widget.onChangeTab(1), // Skills Tab
                                child: Row(
                                  children: [
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppDimensions.kFontSize12,
                                        height: AppDimensions.kLineHeight14(18),
                                        letterSpacing:
                                            AppDimensions.kLetterSpacing14(
                                              -2.5,
                                            ),
                                        color:
                                            AppColors.initColors().primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      AppImages.svgRightArrow,
                                      fit: BoxFit.cover,
                                      color:
                                          AppColors.initColors().primaryColor,
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
                  ),
                  SizedBox(height: 8.h),

                  // 🚀 3. Featured Projects Section (Horizontal List)
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
                          onTap: () => widget.onChangeTab(2), // Projects Tab
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
                      if (state is ProjectLoading) {
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is ProjectLoaded) {
                        final featuredProjects = state.projectList
                            .take(3)
                            .toList(); // We only want to show a few featured projects.

                        if (isMobile) {
                          // Horizontal list for mobile
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
                          // Vertical list for web/desktop
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

                  SizedBox(height: 16.h),

                  // 📊 4. Technical Skills Chart Section
                  Padding(
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
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
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
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color:
                                          AppColors.initColors().primaryColor,
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
}
