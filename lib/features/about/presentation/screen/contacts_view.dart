// import 'package:dmpportfolioapp/features/about/presentation/bloc/about_bloc.dart';
// import 'package:dmpportfolioapp/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ContactsView extends StatefulWidget {
//   const ContactsView({super.key});

//   @override
//   State<ContactsView> createState() => _ContactsViewState();
// }

// class _ContactsViewState extends State<ContactsView> {
//   final AboutBloc _bloc = AboutBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
//         child: SafeArea(
//           child: BlocProvider.value(
//             value: _bloc,
//             child: BlocListener<AboutBloc, AboutState>(
//               listener: (_, state) {},
//               child: Column(children: [

//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
