import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabela_fipe/android/app.dart';
import 'package:tabela_fipe/common/widgets/rounded_linear_progress_indicator.dart';
import 'package:tabela_fipe/ios/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  void startTimer() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_progressValue >= 1.0) {
        timer.cancel();
        if (Platform.isIOS) {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => const IOSApp(),
          ));
        } else if (Platform.isAndroid) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AndroidApp(),
          ));
        }
      } else {
        setState(() {
          _progressValue += 0.1;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash_bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 293.0),
                Text(
                  'Logo',
                  style: TextStyle(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontSize: 64.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFAAD14),
                  ),
                ),
                const SizedBox(height: 64.0),
                SizedBox(
                  width: 250.0,
                  height: 10.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: RoundedLinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: const Color(0xffFAAD14),
                      value: _progressValue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copyright, color: Color(0xffFAAD14)),
                const SizedBox(width: 13.5),
                Text(
                  '2023. All rights reserved to DevsFree.',
                  style: TextStyle(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontSize: 14.0,
                    color: const Color(0xffFAAD14),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
