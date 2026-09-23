import 'package:eventlyapp/UI/TabList/ProfileTab/widget/SettingsItem.dart';
import 'package:eventlyapp/UI/TabList/ProfileTab/widget/languageDropdown.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../providers/app_theme_providers.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50.r),
              child: CircleAvatar(
                radius: 45.r,
                child: Image.asset(AppAssets.profileImage),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
             FirebaseAuth.instance.currentUser?.displayName??"",
              style: themeProvider.isDarkMode()
                  ? AppStyle.bold20whiteColorTextDarkMode
                  : AppStyle.bold20blackColorTextLightMode,
            ),
            SizedBox(height: 4.h),
            Text(
              FirebaseAuth.instance.currentUser?.email??"",
              style: AppStyle.regular14secTextLightMode,
            ),
            SizedBox(height: 32.h),
            SettingsItem(
              title: themeProvider.isDarkMode()
                  ? AppLocalizations.of(context)!.lightMode
                  : AppLocalizations.of(context)!.darkmode,
              isDark: themeProvider.isDarkMode(),
              trailing: Switch(
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });

                  themeProvider.changeThemeMode(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            LanguageDropdown(),
            SizedBox(height: 16.h),
            SettingsItem(
              title: AppLocalizations.of(context)!.logout,
              isDark: themeProvider.isDarkMode(),
              trailing: const Icon(Icons.logout, color: AppColor.redColor),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(AppRoutes.loginRouteName);

              },
            ),
          ],
        ),
      ),
    );
  }
}
