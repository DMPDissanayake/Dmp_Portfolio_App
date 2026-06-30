import 'package:dmpportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/home_banner.dart';
import 'package:dmpportfolioapp/features/home/data/models/entity/skill_data.dart';
import 'package:dmpportfolioapp/features/home/presentation/widgets/premium_skill_line_chart.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: InkWell(
                        onTap: () {
                          widget.onChangeTab(4, data: widget.data);
                        },
                        child: const HomeBanner(),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                child: Text(
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
      ),
    );
  }
}
