import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash_screen.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MHT CET Preparation',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFCF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4520B8),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
      routes: AppRoutes.routes,
    );
  }
}
