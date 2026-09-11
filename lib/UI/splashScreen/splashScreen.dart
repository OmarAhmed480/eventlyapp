import 'dart:async';

import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_providers.dart';
import '../../utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onBoardinRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 270.h),
          Center(
            child: Image.asset(
              themeProvider.isDarkMode()
                  ? AppAssets.eventlyLogoDark
                  : AppAssets.eventlyLogoLight,
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(height: 258.h),

          Image.asset(
            themeProvider.isDarkMode()
                ? AppAssets.prandinDark
                : AppAssets.prandinLight,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
