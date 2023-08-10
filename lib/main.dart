import 'package:flutter/material.dart';
import 'package:hajj_app/screens/introduction/main.dart';
import 'package:hajj_app/screens/auth/login.dart';
import 'package:hajj_app/screens/auth/register.dart';
import 'package:hajj_app/screens/hajj_feature/home.dart';
import 'package:hajj_app/screens/hajj_feature/find_me.dart';
import 'package:hajj_app/screens/hajj_feature/search.dart';
import 'package:hajj_app/screens/hajj_feature/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          '/introduction', // Set the initial route to the Introduction screen
      routes: {
        '/introduction': (context) => const Introduction(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/find_me': (context) => const FindMeScreen(),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
