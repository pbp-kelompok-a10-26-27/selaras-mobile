import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/home/screens/menu_screen.dart';

void main() {
  runApp(const SelarasApp());
}

/// Root widget for the SELARAS Mobile application.
class SelarasApp extends StatelessWidget {
  const SelarasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SELARAS Mobile',
      theme: AppTheme.lightTheme,
      home: MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
