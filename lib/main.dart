import 'package:flutter/material.dart';
import 'package:login_api1/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:login_api1/presentation/login_screen/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginScreenController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
