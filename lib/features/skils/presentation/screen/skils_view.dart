import 'package:dmpportfolioapp/features/skils/data/models/entity/experience_item.dart';
import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_bloc.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/currently_mastering_crad.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/experience_section.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/key_awards_section.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/progress_timeline.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/quick_metrics_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/title_skil_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/professional_skills_card.dart';
import 'package:dmpportfolioapp/features/skils/presentation/widgets/techical_skills_card.dart';
import 'package:dmpportfolioapp/shared/common/custom_segmented_control_widget.dart';
import 'package:dmpportfolioapp/shared/common/custom_tab_bar_widget.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:dmpportfolioapp/utils/app_images.dart';
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

  //Professional Skills
  final List<ProfessionalSkills> _professionalSkills = [
    ProfessionalSkills(
      title: 'Communication Skills',
      icon: AppImages.svgCommunication,
    ),
    ProfessionalSkills(title: 'Time Management', icon: AppImages.svgTime),
    ProfessionalSkills(title: 'Agile/Scrum Workflow', icon: AppImages.svgAgile),
    ProfessionalSkills(
      title: 'Requirement Analysis',
      icon: AppImages.svgRequirement,
    ),
    ProfessionalSkills(
      title: 'Attention to Detail',
      icon: AppImages.svgAttention,
    ),
    ProfessionalSkills(title: 'Adaptability', icon: AppImages.svgAdaptability),
    ProfessionalSkills(title: 'Quick Learning', icon: AppImages.svgLearning),
    ProfessionalSkills(title: 'Leadership', icon: AppImages.svgLeadership),
    ProfessionalSkills(
      title: 'Client Communication',
      icon: AppImages.svgClient,
    ),
  ];

  final List<MilestoneItem> milestones = [
    MilestoneItem(
      years: ["2023", "2024", "2025"],
      description: "Member of Uva Province Elle Team",
    ),
    MilestoneItem(
      years: ["2022", "2023", "2024"],
      description: "Represented university at Sri Lanka University Games",
    ),
    MilestoneItem(
      years: ["2019", "2024", "2025"],
      description:
          "Awarded University Colors – Elle Event, Rajarata University of Sri Lanka",
    ),
    MilestoneItem(
      years: ["2017 – 2018"],
      description: "Sumanagale College School Head Prefect",
    ),
    MilestoneItem(
      years: ["2016 – 2018"],
      description: "Speaker of the School Student Parliament",
    ),
    MilestoneItem(
      years: ["2014 – 2015"],
      description: "Deputy Minister – Uva Provincial Student Parliament",
    ),
  ];

  final List<ProgressTimelineItem> roadmapItems = [
    ProgressTimelineItem(
      icon: Icons.speed,
      title: "Flutter Web Optimization",
      description: "Performance tuning and rendering strategies",
      tagText: "In Progress",
      progress: 0.4, // Matches the partially completed ring look
    ),
    ProgressTimelineItem(
      icon: Icons.rocket_launch_outlined,
      title: "CI/CD",
      description:
          "Automated deployment pipelines with GitHub Actions/Codemagic",
      tagText: "Deep Dive",
      progress: 0.3,
    ),
    ProgressTimelineItem(
      icon: Icons.token_outlined, // Swap out for a custom asset image if needed
      title: "Docker",
      description: "Containerization for scalable backend and web environments",
      tagText: "Deep Dive",
      progress: 0.3,
    ),
    ProgressTimelineItem(
      icon: Icons.shield_outlined,
      title: "Unit & Widget Testing",
      description: "Ensuring high-quality code with 100% test coverage",
      tagText: "Advanced",
      progress: 0.75,
    ),
  ];

  // --- PLACE THIS IN A MOCK DATA FILE OR DIRECTLY IN YOUR VIEW CONTROLLER ---
  final List<ExperienceItem> mockExperiences = [
    ExperienceItem(
      icon: Icons.work_outline,
      role: "Associate Mobile Engineer",
      company: "Aventure IT Solution",
      duration: "Feb 2025 – Present",
      statusTag: "Current",
      highlights: [
        "Delivered 2+ production-ready Flutter apps with 99.9% crash-free performance.",
        "Integrated 15+ REST API endpoints with FCM & CI/CD (GitHub Actions/Fastlane).",
        "Architected scalable code using Clean Architecture & BLoC/Riverpod.",
      ],
      skills: ["Dart", "Figma", "CI/CD", "BLoC", "Riverpod"],
    ),
    ExperienceItem(
      icon: Icons.integration_instructions_outlined,
      role: "Mobile Application Intern",
      company: "Previous Tech Firm",
      duration: "Jun 2024 – Jan 2025",
      statusTag: null, // No tag for past positions
      highlights: [
        "Assisted in developing feature modules and custom responsive UI widgets based on high-fidelity Figma models.",
        "Collaborated with backend teams to integrate REST APIs and manage client-side state handling.",
      ],
      skills: ["Flutter", "Dart", "Git", "REST API", "Figma"],
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
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Mobile Development',
                                      skillsList: [
                                        'Flutter',
                                        'Dart',
                                        'Android Development',
                                        'Android Native',
                                        'Responsive UI Development',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'State Management',
                                      skillsList: [
                                        'BLoC',
                                        'Provider',
                                        'Riverpod',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Architecture',
                                      skillsList: [
                                        'Clean Architecture',
                                        'Repository Pattern',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Backend & APIs',
                                      skillsList: [
                                        'REST API Integration',
                                        'Firebase Authentication',
                                        'Firebase Firestore',
                                        'Push Notifications',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Local Storage',
                                      skillsList: [
                                        'Hive',
                                        'Hive',
                                        'Android Development',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Tools & Platforms',
                                      skillsList: [
                                        'Git & GitHub',
                                        'Android Studio',
                                        'VS Code',
                                        'Postman',
                                        'FlutterFire CLI',
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    TechicalSkillsCard(
                                      icon: AppImages.svgMobileDelopment,
                                      title: 'Testing & QA',
                                      skillsList: [
                                        'Manual Testing',
                                        'Debugging',
                                        'Widget Testing',
                                        'API Testing',
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_selectedIndex == 1)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ProfesinalTitleSkilCard(
                                    title: 'Professional Skills',
                                    subtitle:
                                        'A snapshot of the strengths I bring to every team',
                                  ),
                                  SizedBox(height: 8.h),
                                  Expanded(
                                    child: GridView.builder(
                                      itemCount: _professionalSkills.length,
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
                                            _professionalSkills[index];
                                        return ProfessionalSkillsCard(
                                          title: skill.title,
                                          icon: skill.icon,
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
                                              count: 2,
                                              title: 'Years Learning Flutter',
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count: 10,
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
                                              count: 20,
                                              title: 'Technologies Used',
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: QuickMetricsCard(
                                              count: 50,
                                              title: 'Git Commits',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      MilestoneTimeline(
                                        title: "Key Awards & Milestones",
                                        items: milestones,
                                        primaryColor: AppColors.initColors()
                                            .primaryColor, // Adjust tone match your exact UI hex
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
                                          items: roadmapItems,
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
                              SizedBox(height: 16.h),
                              ExperienceSection(experiences: mockExperiences),
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
