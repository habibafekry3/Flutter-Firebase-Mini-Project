import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_mini_project/firebase_options.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
