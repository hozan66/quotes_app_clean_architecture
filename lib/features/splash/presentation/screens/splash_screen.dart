// Packages
import 'dart:async';
import 'package:flutter/material.dart';

// Config
import '../../../../config/routes/app_routes.dart';

// Core
import '../../../../core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer; // import 'dart:async';

  _goNext() => Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // Closing the timer
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.quote),
      ),
    );
  }
}
