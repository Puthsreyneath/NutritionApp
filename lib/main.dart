import 'package:flutter/material.dart';
import 'package:test_clone_1/Recipes_part/explore.dart';
import 'package:test_clone_1/welcome_page/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_clone_1/auth/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
