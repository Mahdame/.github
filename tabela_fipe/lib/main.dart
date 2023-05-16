import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabela_fipe/splash_screen.dart';

void main() {
  if (Platform.isIOS) {
    runApp(
      CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: Navigator(
          onGenerateRoute: (settings) {
            return CupertinoPageRoute(builder: (context) => const SplashScreen());
          },
        ),
      ),
    );
  } else if (Platform.isAndroid) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) => const SplashScreen());
          },
        ),
      ),
    );
  }
}
