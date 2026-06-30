import 'package:dmpportfolioapp/features/education/presentation/bloc/edaduation_bloc.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EduactionView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const EduactionView({super.key, required this.onChangeTab, this.data});

  @override
  State<EduactionView> createState() => _EduactionViewState();
}

class _EduactionViewState extends State<EduactionView> {
  final EdaduationBloc _bloc = EdaduationBloc();
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Eduaction View')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
