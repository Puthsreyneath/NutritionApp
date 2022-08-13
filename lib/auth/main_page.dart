import 'package:flutter/material.dart';
import '../Recipes_part/explore.dart';
import '../profile_page/nav.dart';
import '../welcome_page/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Explore();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
