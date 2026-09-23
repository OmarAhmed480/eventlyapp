import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeaderActions extends StatelessWidget {
 var themeProvider;
 var languageProvider;

 HomeHeaderActions({
    super.key,
    required this.themeProvider,
    required this.languageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            themeProvider.changeThemeMode(
              themeProvider.isDarkMode()
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          icon: Image.asset(
            themeProvider.isDarkMode()
                ? AppAssets.moon
                : AppAssets.sunDark,
            color: AppColor.blueColor,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 40.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: AppColor.blueColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.w,
              color: themeProvider.isDarkMode()
                  ? Colors.transparent
                  : AppColor.whiteColor,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              languageProvider.changeLanguage(
                languageProvider.appLanguage == "en"
                    ? "ar"
                    : "en",
              );
            },
            icon: Text(
              languageProvider.appLanguage == "en"
                  ? "Ar"
                  : "En",
              style: AppStyle.semibold14whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}