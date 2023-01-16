import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kathford/firebase_options.dart';
import 'package:kathford/languages/language.dart';
import 'package:kathford/screens/home.screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: localization().appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: GoogleFonts.breeSerif(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
