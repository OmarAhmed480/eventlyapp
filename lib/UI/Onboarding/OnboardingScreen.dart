import 'package:eventlyapp/UI/Onboarding/widget/settingOptionRow.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_providers.dart';
import '../../providers/app_theme_providers.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styel.dart';

class OnBoarDingScreen extends StatelessWidget {
  OnBoarDingScreen({super.key});

  final GlobalKey<IntroductionScreenState> introKey =
  GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<AppLanguageProviders>(context);
    final themeProvider = Provider.of<AppThemeProviders>(context);

    final isDark = themeProvider.isDarkMode();

    final pageDecoration = PageDecoration(
      titleTextStyle: isDark
          ? AppStyle.semibold14whiteColor.copyWith(
        fontSize: 20.sp,
      )
          : AppStyle.semibold14whiteColor.copyWith(
        fontSize: 20.sp,
        color: AppColor.blackColor,
      ),
      bodyTextStyle: isDark
          ? AppStyle.regular14secTextDarkMode
          : AppStyle.regular14secTextLightMode,
      bodyPadding: EdgeInsets.fromLTRB(
        16.w,
        0,
        16.w,
        16.h,
      ),
      pageColor: isDark
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: isDark
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      appBar: AppBar(
        title: Image.asset(
          isDark
              ? AppAssets.eventty
              : AppAssets.eventty2,
        ),
        centerTitle: true,
        backgroundColor: isDark
            ? AppColor.bGDarkMode
            : AppColor.bGLightMode,
        actions: [
          TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              height: 32.h,
              width: 63.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.ofWhiteColor,
                ),
                color: isDark
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "Skip",
                style: isDark
                    ? AppStyle.semibold14whiteColor
                    : AppStyle.semibold14whiteColor.copyWith(
                  color: AppColor.mainBlueColor,
                ),
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: REdgeInsets.only(
              left: 8,
              top: 8,
              right: 8,
              bottom: 8,
            ),
            child: Container(
              padding: REdgeInsets.only(left: 9),
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: isDark
                      ? AppColor.strokeBlueColor
                      : AppColor.ofWhiteColor,
                ),
                color: isDark
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: isDark
                    ? AppColor.whiteColor
                    : AppColor.blueColor,
              ),
            ),
          ),
        ),
      ),
      body:Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                IntroductionScreen(
                  key: introKey,
                  showNextButton: false,
                  showDoneButton: false,
                  showBackButton: false,
                  showSkipButton: false,

                  pages: [
                    PageViewModel(
                      title: "Personalize Your Experience",
                      body:
                      "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                      image: Image.asset(
                        isDark
                            ? AppAssets.beingCreativeDark1
                            : AppAssets.beingCreative1,
                      ),
                      decoration: pageDecoration,
                    ),

                    PageViewModel(
                      title: "Find Events That Inspire You",
                      body:
                      "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                      image: Image.asset(
                        isDark
                            ? AppAssets.beingCreativeDark2
                            : AppAssets.beingCreative2,
                      ),
                      decoration: pageDecoration,
                      footer: Padding(
                        padding: REdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          children: [
                            SettingOptionRow(
                              title: "Language",
                              spacing: 70,
                              isDarkMode: isDark,
                              options: [
                                SettingOptionButton(
                                  isDarkMode: isDark,
                                  isSelected:
                                  languageProvider.appLanguage == "ar",
                                  onTap: () {
                                    languageProvider.changeLanguage("ar");
                                  },
                                  child: Text(
                                    "Arabic",
                                    style: isDark
                                        ? AppStyle.regular14secTextDarkMode
                                        : AppStyle.regular14secTextLightMode,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                SettingOptionButton(
                                  isDarkMode: isDark,
                                  isSelected:
                                  languageProvider.appLanguage == "en",
                                  onTap: () {
                                    languageProvider.changeLanguage("en");
                                  },
                                  child: Text(
                                    "English",
                                    style: isDark
                                        ? AppStyle.regular14secTextDarkMode
                                        : AppStyle.regular14secTextLightMode,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 18.5.h),

                            SettingOptionRow(
                              title: "Theme",
                              spacing: 130,
                              isDarkMode: isDark,
                              options: [
                                SettingOptionButton(
                                  width: 60,
                                  isDarkMode: isDark,
                                  isSelected:
                                  themeProvider.appTheme ==
                                      ThemeMode.light,
                                  onTap: () {
                                    themeProvider.changeThemeMode(
                                      ThemeMode.light,
                                    );
                                  },
                                  child: Image.asset(
                                    AppAssets.sun,
                                    color:
                                    themeProvider.appTheme ==
                                        ThemeMode.light
                                        ? AppColor.blueColor
                                        : AppColor.ofWhiteColor,
                                    fit: BoxFit.fill,
                                  ),
                                ),

                                SizedBox(width: 8.w),

                                SettingOptionButton(
                                  width: 60,
                                  isDarkMode: isDark,
                                  isSelected:
                                  themeProvider.appTheme ==
                                      ThemeMode.dark,
                                  onTap: () {
                                    themeProvider.changeThemeMode(
                                      ThemeMode.dark,
                                    );
                                  },
                                  child: Image.asset(
                                    AppAssets.moon,
                                    color:
                                    themeProvider.appTheme ==
                                        ThemeMode.dark
                                        ? AppColor.whiteColor
                                        : AppColor.blueColor,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 30.h),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  introKey.currentState?.animateScroll(2);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: REdgeInsets.symmetric(
                                    vertical: 10.h,
                                  ),
                                  backgroundColor: isDark
                                      ? AppColor.mainBlueColor
                                      : AppColor.blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: Text(
                                  "Let's start",
                                  style: AppStyle
                                      .medium20whiteColorTextDarkMode,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    PageViewModel(
                      title: "Effortless Event Planning",
                      body:
                      "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                      image: Image.asset(
                        isDark
                            ? AppAssets.beingCreativeDark3
                            : AppAssets.beingCreative3,
                      ),
                      decoration: pageDecoration,
                      footer: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            introKey.currentState?.animateScroll(3);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: REdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            backgroundColor: isDark
                                ? AppColor.mainBlueColor
                                : AppColor.blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: AppStyle
                                .medium20whiteColorTextDarkMode,
                          ),
                        ),
                      ),
                    ),

                    PageViewModel(
                      title: "Connect with Friends & Share Moments",
                      body:
                      "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together.",
                      image: Image.asset(
                        isDark
                            ? AppAssets.beingCreativeDark4
                            : AppAssets.beingCreative4,
                        fit: BoxFit.fill,
                      ),
                      decoration: pageDecoration,
                      footer: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,AppRoutes.homeRouteName);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: REdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            backgroundColor: isDark
                                ? AppColor.mainBlueColor
                                : AppColor.blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "Get Started",
                            style: AppStyle
                                .medium20whiteColorTextDarkMode,
                          ),
                        ),
                      ),
                    ),
                  ],

                  dotsDecorator: DotsDecorator(
                    size: const Size(10, 10),
                    color: AppColor.ofWhiteColor,
                    activeColor: AppColor.blueColor,
                    activeSize: const Size(22, 10),
                    activeShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),

                  dotsContainerDecorator: ShapeDecoration(
                    color: isDark
                        ? AppColor.bGDarkMode
                        : AppColor.bGLightMode,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}