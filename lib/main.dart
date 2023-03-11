import 'package:ebizz_practical_task/app/constants/font_constants.dart';
import 'package:ebizz_practical_task/app/utils/navigation_utils.dart';
import 'package:ebizz_practical_task/app/utils/theme.dart';
import 'package:ebizz_practical_task/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

CustomTheme? appTheme;

void main() {

  appTheme = CustomTheme();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebizz Flutter Task',
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: appTheme!.colorPrimary,
        fontFamily: DefaultFont,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationUtilities.key,
      home: const HomeScreenView(),
    );
  }
}