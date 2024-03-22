import 'package:assignment/screens/page_one/page_one_screen.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          background: context.constantUi.colorDefaultBg,
        ),
        appBarTheme: AppBarTheme(
          color: context.constantUi.colorDefaultBg,
          surfaceTintColor: context.constantUi.colorDefaultBg,
          centerTitle: false,
          elevation: 0.5,
        ),
      ),
      home: const PageOneScreen(),
    );
  }
}
