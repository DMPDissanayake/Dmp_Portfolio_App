import 'package:dmpportfolioapp/features/education/data/models/eduacation_item_model.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
import 'package:dmpportfolioapp/features/education/presentation/widgets/eduaction_title_widget.dart';
import 'package:dmpportfolioapp/features/education/presentation/widgets/education_qualifications_section.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EduactionView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const EduactionView({super.key, required this.onChangeTab, this.data});

  @override
  State<EduactionView> createState() => _EduactionViewState();
}

class _EduactionViewState extends State<EduactionView> {
  final EdaduationBloc _bloc = EdaduationBloc();

  final List<EduacationItemModel> mockTimelineData = [
    EduacationItemModel(
      title: "B.Sc. (Hons) in Information Systems (Special)",
      institution: "Rajarata University of Sri Lanka",
      dateRange: "Apr 2021 – Jan 2025",
      icon: Icons.school_rounded, // Graduation cap icon
      bulletPoints: [
        "Specialized in Information Systems and Software Development.",
      ],
      highlightBoxText:
          "Research Publication: 'Cybersecurity Perception Among Undergraduates in Sri Lanka'",
    ),
    EduacationItemModel(
      title: "Java Certification – Computer Software Engineering",
      institution: "ACPT – Academy of Computer Programming and Training",
      dateRange: "Jan 2024 – Jul 2024",
      icon: Icons.emoji_events_outlined, // Certificate ribbon/badge style icon
      bulletPoints: [
        "Completed advanced professional Java and Object-Oriented Programming (OOP) training.",
        "Developed production-ready desktop applications using Java and JavaFX.",
      ],
      highlightBoxText: null, // No research box for this one
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
            child: BlocListener<EdaduationBloc, EdaduationState>(
              listener: (_, state) {},
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const EduactionTitleSkilCard(
                    title: 'Education & Qualifications',
                    subtitle: 'Academic foundation and professional training.',
                  ),
                  SizedBox(height: 16.h),
                  EaduationSection(data: mockTimelineData),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
