
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/app_language_providers.dart';
import '../../../../providers/app_theme_providers.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProviders>(context);
    return DropdownButtonFormField<String>(
      dropdownColor: themeProvider.isDarkMode()
          ? AppColor.inputsBlueDarkMode
          : AppColor.whiteColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColor.mainBlueColor
                : AppColor.strokeWhiteColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColor.mainBlueColor
                : AppColor.strokeWhiteColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColor.mainBlueColor
                : AppColor.strokeWhiteColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColor.mainBlueColor
                : AppColor.strokeWhiteColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        filled: true,
        fillColor: themeProvider.isDarkMode()
            ? AppColor.inputsBlueDarkMode
            : AppColor.whiteColor,
      ),
      icon: Icon(
        Icons.arrow_forward_ios,
        color: themeProvider.isDarkMode()
            ? AppColor.mainBlueColor
            : AppColor.blueColor,
      ),

      style: themeProvider.isDarkMode()
          ? AppStyle.bold16whiteColorTextLightMode
          : AppStyle.bold16blackColorTextLightMode,

      initialValue: languageProvider.appLanguage,

      items: [
        DropdownMenuItem(
          value: "ar",
          child: Text(AppLocalizations.of(context)!.arabic),
        ),
        DropdownMenuItem(
          value: "en",
          child: Text(AppLocalizations.of(context)!.english),
        ),
      ],

      onChanged: (value) {
        languageProvider.changeLanguage(value!);
      },
    );
  }
}
