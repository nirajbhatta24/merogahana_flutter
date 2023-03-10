import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    });
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Image.asset("assets/images/splashlogo.png"),
      ),
      
    );
  }
  
}