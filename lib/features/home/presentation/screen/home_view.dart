import 'package:dmpportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const HomeView({super.key, required this.onChangeTab, this.data});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc _bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: _bloc,
          child: BlocListener<HomeBloc, HomeState>(
            listener: (_, state) {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Home View')],
            ),
          ),
        ),
      ),
    );
  }
}
