import 'package:dmpportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/home_banner.dart';
import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/premium_skill_line_chart.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/quick_access_card.dart';
import 'package:dmpportfolioapp/features/projects/data/models/project_entity.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_card.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const HomeView({super.key, required this.onChangeTab, this.data});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc _bloc = HomeBloc();

  final List<SkillData> mySkills = [
    SkillData(name: 'Flutter', percentage: 80),
    SkillData(name: 'Dart', percentage: 85),
    SkillData(name: 'Clean Architecture', percentage: 80),
    SkillData(name: 'REST API', percentage: 90),
    SkillData(name: 'Git', percentage: 70),
  ];

  final List<ProjectEntity> projects = [
    ProjectEntity(
      id: "1",
      title: "E-Commerce App",
      shortDescription: "A modern shopping application built with Flutter.",
      fullDescription:
          "A complete e-commerce application with authentication, cart management, wishlist, payment flow, REST API integration, and Clean Architecture.",
      thumbnail: "assets/images/projects/ecommerce.png",
      images: AppImages.projectExPng,
      technologies: [
        "Flutter",
        "Bloc",
        "Clean Architecture",
        "REST API",
        "Firebase",
        "Isar",
      ],
      githubUrl: "https://github.com/your_username/ecommerce_app",
      liveDemoUrl: "",
      isFeatured: true,
      isCompleted: true,
      duration: "2026",
      icon: AppImages.svgEv,
      color: AppColors.initColors().successColor,
    ),
    ProjectEntity(
      id: "2",
      title: "EV Charging App",
      shortDescription: "Electric vehicle charging station application.",
      fullDescription:
          "A Flutter application for locating charging stations, viewing charging history, and managing user accounts.",
      thumbnail: "assets/images/projects/ev.png",
      images: AppImages.projectExPng,
      technologies: ["Flutter", "Bloc", "REST API", "Firebase"],
      githubUrl: "",
      liveDemoUrl: "",
      isFeatured: true,
      isCompleted: true,
      duration: "2025",
      icon: AppImages.svgEv,
      color: AppColors.initColors().successColor,
    ),
    ProjectEntity(
      id: "3",
      title: "EV Charging App",
      shortDescription: "Electric vehicle charging station application.",
      fullDescription:
          "A Flutter application for locating charging stations, viewing charging history, and managing user accounts.",
      thumbnail: "assets/images/projects/ev.png",
      images: AppImages.projectExPng,
      technologies: ["Flutter", "Bloc", "REST API", "Firebase"],
      githubUrl: "",
      liveDemoUrl: "",
      isFeatured: true,
      isCompleted: true,
      duration: "2025",
      icon: AppImages.svgEv,
      color: AppColors.initColors().successColor,
    ),
    ProjectEntity(
      id: "4",
      title: "EV Charging App",
      shortDescription: "Electric vehicle charging station application.",
      fullDescription:
          "A Flutter application for locating charging stations, viewing charging history, and managing user accounts.",
      thumbnail: "assets/images/projects/ev.png",
      images: AppImages.projectExPng,
      technologies: ["Flutter", "Bloc", "REST API", "Firebase"],
      githubUrl: "",
      liveDemoUrl: "",
      isFeatured: true,
      isCompleted: true,
      duration: "2025",
      icon: AppImages.svgEv,
      color: AppColors.initColors().successColor,
    ),
    ProjectEntity(
      id: "5",
      title: "EV Charging App",
      shortDescription: "Electric vehicle charging station application.",
      fullDescription:
          "A Flutter application for locating charging stations, viewing charging history, and managing user accounts.",
      thumbnail: "assets/images/projects/ev.png",
      images: AppImages.projectExPng,
      technologies: ["Flutter", "Bloc", "REST API", "Firebase"],
      githubUrl: "",
      liveDemoUrl: "",
      isFeatured: true,
      isCompleted: true,
      duration: "2025",
      icon: AppImages.svgEv,
      color: AppColors.initColors().successColor,
    ),
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
            child: BlocListener<HomeBloc, HomeState>(
              listener: (_, state) {},
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.onChangeTab(4, data: widget.data);
                      },
                      child: const HomeBanner(),
                    ),
                    SizedBox(height: 12.h),
                    //Quick Access Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Skills',
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
                              InkWell(
                                onTap: () {
                                  widget.onChangeTab(1);
                                },
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AccessCard(
                                name: 'Technical',
                                icon: AppImages.svgTechnical,
                                onTap: () {},
                              ),
                              AccessCard(
                                name: 'Professional',
                                icon: AppImages.svgProfessional,
                                onTap: () {},
                              ),
                              AccessCard(
                                name: 'Achievements',
                                icon: AppImages.svgTrophy,
                                onTap: () {},
                              ),
                              AccessCard(
                                name: 'Learning',
                                icon: AppImages.svgLearning,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Horizontal list of Projects Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
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
                          InkWell(
                            onTap: () {
                              widget.onChangeTab(2); // Navigate to Projects tab
                            },
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
                    SizedBox(
                      height: 280.h, // Provide a fixed height for the list
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: projects.length,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: ProjectCard(project: projects[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    //Technical Skills Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
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
                              InkWell(
                                onTap: () {
                                  widget.onChangeTab(1);
                                },
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
                          PremiumSkillLineChart(skills: mySkills),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
