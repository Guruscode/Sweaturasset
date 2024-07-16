import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // set font
            fontFamily: GoogleFonts.inter().fontFamily,
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
