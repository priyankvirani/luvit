import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luvit/helper/colors.dart';
import 'package:luvit/helper/string.dart';
import 'package:luvit/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          background: whiteColor,
        ),
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      home: MainScreen(),
    );
  }
}

