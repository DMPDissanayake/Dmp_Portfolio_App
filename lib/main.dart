import 'package:dmpportfolioapp/app/dmpportfolioapp.dart';
import 'package:dmpportfolioapp/core/di/injection_container.dart' as di;
import 'package:dmpportfolioapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await di.initDependencies();

  runApp(const DmpPortfolioApp());
}
