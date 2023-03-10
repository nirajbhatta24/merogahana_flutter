
import 'package:flutter/material.dart';
import 'package:mero_gahana/app/theme.dart';
import 'package:mero_gahana/screens/buttomscreen/dashboard.dart';
import 'package:mero_gahana/screens/login_screen.dart';
import 'package:mero_gahana/screens/register_screen.dart';
import 'package:mero_gahana/screens/splashscreen.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merogahana',
      debugShowCheckedModeBanner:
       false,
      theme: getApplicationTheme(),
      initialRoute: '/',
      routes: {
        // '/':(context) => const LoginScreenWear(),
        // '/dashboardScreen':(context) => const DashboardScreenWear(),
        // DashboardScreenWear.route: (context) => const DashboardScreenWear(),

        '/':(context) => const SplashScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        RegisterScreen.route: (context) => const RegisterScreen(),
        DashboardScreen.route: (context) => const DashboardScreen(),
        // ProductPage.route : (context) => const ProductPage(),
      },
    );
  }
}