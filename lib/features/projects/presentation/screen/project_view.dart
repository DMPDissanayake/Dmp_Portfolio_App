import 'package:dmpportfolioapp/core/di/injection_container.dart';
import 'package:dmpportfolioapp/features/projects/data/models/project_model.dart';
import 'package:dmpportfolioapp/features/projects/domain/entities/project_entity.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_state.dart';
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
  final ProjectBloc _bloc = sl<ProjectBloc>();

  int activeTabId = 1;

  final List<TabTata> myTabs = [
    TabTata(id: 1, name: "Organizations"),
    TabTata(id: 2, name: "Personal"),
  ];

  bool _isLoading = false;
  List<ProjectEntity> _organizationProjectList = [];
  List<ProjectEntity> _personalProjectList = [];
  String? _errorMessage;

  @override
  void initState() {
    _bloc.add(FetchProjectData());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

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
              listener: (_, state) {
                if (state is ProjectLoading) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                } else if (state is ProjectLoaded) {
                  setState(() {
                    _isLoading = false;
                    //organization projects
                    _organizationProjectList = state.projectList
                        .where((project) => project.category == 'organization')
                        .toList();

                    //personal projects
                    _personalProjectList = state.projectList
                        .where((project) => project.category == 'personal')
                        .toList();
                  });
                } else if (state is ProjectError) {
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
                              itemCount: _organizationProjectList.length,
                              itemBuilder: (context, index) {
                                final project = _organizationProjectList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: DetaileProjectCard(project: project),
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
                              itemCount: _personalProjectList.length,
                              itemBuilder: (context, index) {
                                final project = _personalProjectList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: DetaileProjectCard(project: project),
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
