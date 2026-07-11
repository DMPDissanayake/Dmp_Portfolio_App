import 'package:dmpportfolioapp/core/di/injection_container.dart';
import 'package:dmpportfolioapp/features/education/domain/entities/education_entity.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_event.dart';
import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_state.dart';
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
  final EducationBloc _bloc = sl<EducationBloc>();
  bool _isLoading = false;
  List<EducationEntity> _educationList = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchEducationData());
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
            child: BlocListener<EducationBloc, EducationState>(
              listener: (_, state) {
                if (state is EducationLoading) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                } else if (state is EducationLoaded) {
                  setState(() {
                    _isLoading = false;
                    _educationList = state.educationList;
                  });
                } else if (state is EducationError) {
                  setState(() {
                    _isLoading = false;
                    _errorMessage = state.message;
                  });
                }
              },
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const EduactionTitleSkilCard(
                    title: 'Education & Qualifications',
                    subtitle: 'Academic foundation and professional training.',
                  ),
                  SizedBox(height: 16.h),
                  Expanded(child: _buildBody()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.amber),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (_educationList.isEmpty) {
      return const Center(
        child: Text("No Data Found", style: TextStyle(color: Colors.white)),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: EaduationSection(data: _educationList),
    );
  }
}
