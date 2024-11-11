import 'package:exajovii/auth/login.dart';
import 'package:exajovii/auth/profile_screen.dart';
import 'package:exajovii/firebase_options.dart';
import 'package:exajovii/auth/register.dart';
import 'package:exajovii/home/gasto_create.dart';
import 'package:exajovii/home/navigation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/navigation': (context) => const Navigation(),
        '/register': (context) => const Register(),
        '/profile': (context) => const ProfileScreen(),
        '/create': (context) => const GastoCreate(),
      },
    );
  }
}
