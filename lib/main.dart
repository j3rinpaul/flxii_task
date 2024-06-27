import 'package:flexii/core/utils.dart';
import 'package:flexii/admin/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Design.primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.karlaTextTheme(Typography.dense2021),
      ),
      home: DashBoard()
    );
  }
}
