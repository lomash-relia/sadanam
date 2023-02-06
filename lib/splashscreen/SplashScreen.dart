import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotelbellevue/auth/login_screen.dart';
import 'package:hotelbellevue/dashboard/DashBoard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  User? user;
  @override
  void initState() {
    super.initState();
    user=FirebaseAuth.instance.currentUser;
  }

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
      loadingText: Text("Loading..."),
      navigator: user!=null? DashBoardScreen():LoginScreen(),
      durationInSeconds: 4,
    );
  }
}