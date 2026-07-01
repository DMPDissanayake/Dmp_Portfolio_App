import 'package:dmpportfolioapp/features/skils/presentation/bloc/skils_bloc.dart';
import 'package:dmpportfolioapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkilsView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const SkilsView({super.key, required this.onChangeTab, this.data});

  @override
  State<SkilsView> createState() => _SkilsViewState();
}

class _SkilsViewState extends State<SkilsView> {
  final SkilsBloc _bloc = SkilsBloc();

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Skils View')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
