import 'package:dmpportfolioapp/core/di/injection_container.dart';
import 'package:dmpportfolioapp/features/about/domain/entity/profile_entity.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_bloc.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_event.dart';
import 'package:dmpportfolioapp/features/about/presentation/bloc/about_state.dart';
import 'package:dmpportfolioapp/features/about/presentation/widgets/profile_deteile_card.dart';
import 'package:dmpportfolioapp/features/about/presentation/widgets/shimmer_profile_deteile_card.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:dmpportfolioapp/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const AboutView({super.key, required this.onChangeTab, this.data});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final ProfileBloc _bloc = sl<ProfileBloc>();

  bool _isLoading = false;
  ProfileEntity? profileEntity;
  String? _errorMessage;

  @override
  void initState() {
    _bloc.add(FetchProfileData());
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
            child: BlocListener<ProfileBloc, ProfileState>(
              listener: (_, state) {
                if (state is ProfileLoading) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                } else if (state is ProfileLoaded) {
                  setState(() {
                    _isLoading = false;
                    profileEntity = state.data;
                  });
                } else if (state is ProfileError) {
                  setState(() {
                    _isLoading = false;
                    _errorMessage = state.message;
                  });
                }
              },
              child: Column(
                children: [
                  if (_isLoading) const ShimmerProfileDeteileCard(),
                  if (profileEntity != null)
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 28.h),
                          //Profile photo section
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                  4.w,
                                ), // Creates space for the border
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.initColors().nonChangeWhite,
                                  border: Border.all(
                                    color: AppColors.initColors().primaryColor,
                                    width: 3.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.initColors()
                                          .nonChangeBlack
                                          .withOpacity(0.15),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.network(
                                    profileEntity!.profileUrl,
                                    height: 120.h,
                                    width: 120.w,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 120.h,
                                        width: 120.w,
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.person,
                                          size: 60,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,

                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.initColors().primaryColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 3.h,
                                    ),
                                    child: Text(
                                      '2+ Years Learning Flutter',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppDimensions.kFontSize10,
                                        height: AppDimensions.kLineHeight14(18),
                                        letterSpacing:
                                            AppDimensions.kLetterSpacing14(
                                              -2.5,
                                            ),
                                        color: AppColors.initColors()
                                            .textBlackColor1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          ProfileDeteileCard(data: profileEntity!),
                        ],
                      ),
                    ),

                  if (_errorMessage != null)
                    Expanded(
                      child: Center(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
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
