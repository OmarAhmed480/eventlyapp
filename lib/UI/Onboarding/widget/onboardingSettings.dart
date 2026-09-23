import 'package:eventlyapp/UI/Onboarding/widget/settingOptionRow.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSettings extends StatelessWidget {
  final bool isDark;
  final String selectedLanguage;
  final ThemeMode selectedTheme;

  final String languageTitle;
  final String englishText;
  final String arabicText;
  final String themeTitle;

  final VoidCallback onEnglishSelected;
  final VoidCallback onArabicSelected;
  final VoidCallback onLightSelected;
  final VoidCallback onDarkSelected;

  const OnboardingSettings({
    super.key,
    required this.isDark,
    required this.selectedLanguage,
    required this.selectedTheme,
    required this.languageTitle,
    required this.englishText,
    required this.arabicText,
    required this.themeTitle,
    required this.onEnglishSelected,
    required this.onArabicSelected,
    required this.onLightSelected,
    required this.onDarkSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),

        // Language
        SettingOptionRow(
          title: languageTitle,
          options: [
            CustomActionButton(
              isSelected: selectedLanguage == "en",
              isDark: isDark,
              onTap: onEnglishSelected,
              width: 83,
              height: 32,
              borderWidth: 1,
              borderRadius: 8,

              // Light - Selected
              selectedLightContainerColor: AppColor.blueColor,
              selectedLightBorderColor: AppColor.strokeBlueColor,
              selectedLightTextStyle: AppStyle.semiBold14WhiteColor,

              // Light - Unselected
              unSelectedLightContainerColor: AppColor.whiteColor,
              unSelectedLightBorderColor: AppColor.strokeWhiteColor,
              unSelectedLightTextStyle: AppStyle.regular14BlueColorText,

              // Dark - Selected
              selectedDarkContainerColor: const Color(0xFF457AED),
              selectedDarkBorderColor: Colors.transparent,
              selectedDarkTextStyle: AppStyle.semiBold14WhiteColorText,

              // Dark - Unselected
              unSelectedDarkContainerColor: const Color(0xFF001440),
              unSelectedDarkBorderColor: const Color(0xFF002D8F),
              unSelectedDarkTextStyle: AppStyle.regular14WhiteColorText,

              child: Text(englishText),
            ),

            SizedBox(width: 8.w),

            CustomActionButton(
              isSelected: selectedLanguage == "ar",
              isDark: isDark,
              onTap: onArabicSelected,
              width: 83,
              height: 32,
              borderWidth: 1,
              borderRadius: 8,

              // Light - Selected
              selectedLightContainerColor: AppColor.blueColor,
              selectedLightBorderColor: AppColor.strokeBlueColor,
              selectedLightTextStyle: AppStyle.semiBold14WhiteColor,

              // Light - Unselected
              unSelectedLightContainerColor: AppColor.whiteColor,
              unSelectedLightBorderColor: AppColor.strokeWhiteColor,
              unSelectedLightTextStyle: AppStyle.regular14BlueColorText,

              // Dark - Selected
              selectedDarkContainerColor: const Color(0xFF457AED),
              selectedDarkBorderColor: Colors.transparent,
              selectedDarkTextStyle: AppStyle.semiBold14WhiteColorText,

              // Dark - Unselected
              unSelectedDarkContainerColor: const Color(0xFF001440),
              unSelectedDarkBorderColor: const Color(0xFF002D8F),
              unSelectedDarkTextStyle: AppStyle.regular14WhiteColorText,

              child: Text(arabicText),
            ),
          ],
          isDarkMode: isDark,
        ),

        SizedBox(height: 15.h),

        // Theme
        SettingOptionRow(
          title: themeTitle,
          options: [
            // Light
            CustomActionButton(
              isSelected: selectedTheme == ThemeMode.light,
              isDark: isDark,
              onTap: onLightSelected,
              width: 56,
              height: 32,
              borderWidth: 1,
              borderRadius: 8,

              // Light - Selected
              selectedLightContainerColor: AppColor.blueColor,
              selectedLightBorderColor: AppColor.strokeBlueColor,
              selectedLightTextStyle: AppStyle.semiBold14WhiteColor,

              // Light - Unselected
              unSelectedLightContainerColor: AppColor.whiteColor,
              unSelectedLightBorderColor: AppColor.strokeWhiteColor,
              unSelectedLightTextStyle: AppStyle.regular14BlueColorText,

              // Dark - Selected
              selectedDarkContainerColor: AppColor.mainBlueColor,
              selectedDarkBorderColor: Colors.transparent,
              selectedDarkTextStyle: AppStyle.semiBold14WhiteColorText,

              // Dark - Unselected
              unSelectedDarkContainerColor: AppColor.inputsBlueDarkMode,
              unSelectedDarkBorderColor: AppColor.strokeBlueColor,
              unSelectedDarkTextStyle: AppStyle.regular14WhiteColorText,

              child: Image.asset(
                isDark ? AppAssets.sunDark : AppAssets.sun,
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(width: 8.w),

            // Dark
            CustomActionButton(
              isSelected: selectedTheme == ThemeMode.dark,
              isDark: isDark,
              onTap: onDarkSelected,
              width: 56,
              height: 32,
              borderWidth: 1,
              borderRadius: 8,

              // Light - Selected
              selectedLightContainerColor: AppColor.blueColor,
              selectedLightBorderColor: AppColor.strokeBlueColor,
              selectedLightTextStyle: AppStyle.semiBold14WhiteColor,

              // Light - Unselected
              unSelectedLightContainerColor: AppColor.whiteColor,
              unSelectedLightBorderColor: AppColor.strokeWhiteColor,
              unSelectedLightTextStyle: AppStyle.regular14BlueColorText,

              // Dark - Selected
              selectedDarkContainerColor: AppColor.mainBlueColor,
              selectedDarkBorderColor: Colors.transparent,
              selectedDarkTextStyle: AppStyle.semiBold14WhiteColorText,

              // Dark - Unselected
              unSelectedDarkContainerColor: AppColor.inputsBlueDarkMode,
              unSelectedDarkBorderColor: AppColor.strokeBlueColor,
              unSelectedDarkTextStyle: AppStyle.regular14WhiteColorText,

              child: Image.asset(
                isDark ? AppAssets.moonDark : AppAssets.moon,
                fit: BoxFit.fill,
              ),
            ),
          ],
          isDarkMode: isDark,
        ),

        SizedBox(height: 25.h),
      ],
    );
  }
}
