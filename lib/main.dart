import 'package:cng_filling_station/fetaures/login/login_page.dart';
import 'package:cng_filling_station/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxkb2JlY2Zqc291bmhqbHVlbm5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4NTcwOTgsImV4cCI6MjA0ODQzMzA5OH0.C-MWKeEqL4EQaE74cgWDZH1awu37NZxKH0amMDgLV9c',
    url: 'https://ldobecfjsounhjluennl.supabase.co',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LoginPage(),
    );
  }
}
