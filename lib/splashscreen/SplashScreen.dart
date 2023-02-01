import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:hotelbellevue/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
          'assets/images/bellevue.png'),
      title: const Text(
        "Hotel Bellevue Surat",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText:const Text("Starting App"),
      navigator: WelcomeScreen(),
      durationInSeconds: 4,
    );
  }
}
