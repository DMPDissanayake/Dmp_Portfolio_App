import 'package:dmpportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectView extends StatefulWidget {
  final Function(int, {dynamic data}) onChangeTab;
  final dynamic data;
  const ProjectView({super.key, required this.onChangeTab, this.data});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final ProjectBloc _bloc = ProjectBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: _bloc,
          child: BlocListener<ProjectBloc, ProjectState>(
            listener: (_, state) {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Project View')],
            ),
          ),
        ),
      ),
    );
  }
}
