import 'package:ai_tennis/core/responsive/responsive_layout.dart';
import 'package:ai_tennis/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:ai_tennis/observe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const AiTennisApp());
}

class AiTennisApp extends StatelessWidget {
  const AiTennisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Tennis',
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0)),
                borderRadius: BorderRadius.circular(20.w(context))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0)),
                borderRadius: BorderRadius.circular(20.w(context))),
          ),
          primarySwatch: Colors.blue,
          useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
