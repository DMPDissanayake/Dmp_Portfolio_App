import 'package:dmpportfolioapp/features/projects/data/models/project_model.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/detaile_project_card.dart';
import 'package:dmpportfolioapp/features/projects/presentation/widgets/project_title_widget.dart';
import 'package:dmpportfolioapp/shared/common/custom_segmented_control_widget.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const ProjectView({super.key, required this.onChangeTab, this.data});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final ProjectBloc _bloc = ProjectBloc();

  int activeTabId = 1;

  final List<TabTata> myTabs = [
    TabTata(id: 1, name: "Organizations"),
    TabTata(id: 2, name: "Personal"),
  ];

  final List<ProjectModel> mockProjects = [
    ProjectModel(
      title: "EVO Charging Operator App",
      category: "E-Mobility",
      description:
          "Real-time monitoring of live EV charging stations using secure RESTful integrations and push alerts.",
      bulletPoints: [
        "Integrated Firebase Cloud Messaging (FCM) for 24/7 real-time user alerts.",
        "Optimized image rendering to reduce memory footprints.",
        "Delivered 99.9% crash-free reliability across production releases.",
      ],
      techStack: ["Flutter", "Dart", "Clean Architecture", "BLoC", "Firebase"],
      onViewLive: () => print("Opening EVO Live..."),
      onAppStore: () => print("Opening EVO App Store..."),
    ),
    ProjectModel(
      title: "Chamber Pro – Legal Operations Management App",
      category: "LegalTech",
      description:
          "Streamlined legal operations by building a structured UI to manage clients, lawyers, cases, and tasks efficiently.",
      bulletPoints: [
        "Optimized user workflow with dynamic data rendering via secure RESTful API integration.",
        "Designed structured, responsive UIs to seamlessly manage complex, multi-entity relationships.",
        "Streamlined development and API testing workflows using Postman and precise Figma designs.",
      ],
      techStack: [
        "Flutter",
        "Dart",
        "REST API",
        "Firebase",
        "Clean Architecture",
        "Postman",
        "Figma",
      ],
      onViewLive: () => print("Opening Chamber Pro Live..."),
      onAppStore: () => print("Opening Chamber Pro App Store..."),
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
            child: BlocListener<ProjectBloc, ProjectState>(
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
                  // Organization Projects
                  if (activeTabId == 1)
                    Expanded(
                      child: Column(
                        children: [
                          const ProjectTitleSkilCard(
                            title: 'Project Showcase',
                            subtitle:
                                'Selected production apps and case studies.',
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: mockProjects.length,
                              itemBuilder: (context, index) {
                                final project = mockProjects[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: DetaileProjectCard(
                                    projectModel: project,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Personal Projects
                  if (activeTabId == 2)
                    Expanded(
                      child: Column(
                        children: [
                          const ProjectTitleSkilCard(
                            title: 'Project Showcase',
                            subtitle:
                                'Selected production apps and case studies.',
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: mockProjects.length,
                              itemBuilder: (context, index) {
                                final project = mockProjects[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: DetaileProjectCard(
                                    projectModel: project,
                                  ),
                                );
                              },
                            ),
                          ),
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
