import 'package:eventlyapp/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/app_theme_providers.dart';
import '../../utils/app_color.dart';
import '../../utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkOnBoarDing();
  }

  bool onBoarDing = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,

      body:
          Center(
                child: Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.eventlyLogoDark
                      : AppAssets.eventlyLogoLight,
                  fit: BoxFit.fill,
                ),
              )
              .animate(
            onComplete: (controller) {
              if (!onBoarDing) {
                Navigator.pushReplacementNamed(context, AppRoutes.onBoardinRouteName,);
              } else {
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName,);
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName,);
                }
              }
            },
              )
              .scale(duration: Duration(seconds: 1))
              .then()
              .scale(duration: Duration(seconds: 1), begin: Offset(.5, .5)),
    );
  }

  Future<void> checkOnBoarDing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoarDing = prefs.getBool('onBoarDing') ?? false;
  }
}
