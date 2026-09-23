import 'dart:ffi';
import 'package:eventlyapp/generailWidget/customAnimatedContainer.dart';
import 'package:eventlyapp/UI/Onboarding/widget/onboardingAppBar.dart';
import 'package:eventlyapp/UI/Onboarding/widget/onboardingSettings.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';
import 'IntroductionModel.dart';
import '../../providers/app_language_providers.dart';
import '../../providers/app_theme_providers.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styel.dart';
import '../Auth/loginScreen/widget/authButton.dart';

class OnBoarDingScreen extends StatefulWidget {
  OnBoarDingScreen({super.key});

  @override
  State<OnBoarDingScreen> createState() => _OnBoarDingScreenState();
}

class _OnBoarDingScreenState extends State<OnBoarDingScreen> {
  int currentPage = 0;
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProviders>(context);
    var isDark = themeProvider.isDarkMode();
    List<IntroductionModel> introductionList = [
      IntroductionModel(
        image: isDark ? AppAssets.beingCreativeDark1 : AppAssets.beingCreative1,
        title: AppLocalizations.of(context)!.personalizeYourExperience,
        content: AppLocalizations.of(context)!.personalizeYourExperienceContent,
      ),
      IntroductionModel(
        image: isDark ? AppAssets.beingCreativeDark2 : AppAssets.beingCreative2,
        title: AppLocalizations.of(context)!.findEventsThatInspireYou,
        content: AppLocalizations.of(context)!.findEventsThatInspireYouContent,
      ),
      IntroductionModel(
        image: isDark ? AppAssets.beingCreativeDark3 : AppAssets.beingCreative3,
        title: AppLocalizations.of(context)!.effortlessEventPlanning,
        content: AppLocalizations.of(context)!.effortlessEventPlanningContent,
      ),
      IntroductionModel(
        image: isDark ? AppAssets.beingCreativeDark4 : AppAssets.beingCreative4,
        title: AppLocalizations.of(context)!.connectWithFriendsShareMoments,
        content: AppLocalizations.of(
          context,
        )!.connectWithFriendsShareMomentsContent,
      ),
    ];
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      appBar: OnboardingAppBar(
        saveOnBoarDing:saveOnBoarDing()  ,
        pageController: pageController,
        currentPage: currentPage,
        isDark: isDark,
      ),
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) => Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          introductionList[index].image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        if (index != 0)
                          Positioned(
                            top: 280.h,
                            left: 0,
                            right: 0,
                            child: CustomPageIndicator(
                              itemCount: introductionList.length,
                              currentPage: currentPage,
                              paddingHorizontal: 6.w,
                              widthActive: 21.w,
                              widthUnActive: 8.w,
                              heightActive: 8.h,
                              heightUnActive: 8.h,
                              activeLightColor: AppColor.blueColor,
                              activeDarkColor: AppColor.mainBlueColor,
                              unActiveLightColor: AppColor.ofWhiteColor,
                              unActiveDarkColor: AppColor.whiteColor,
                              borderRadiusActive: BorderRadius.circular(36.r),
                              borderRadiusUnActive: BorderRadius.circular(36.r),
                              isDark: themeProvider.isDarkMode(),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: languageProvider.appLanguage == "en"
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Text(
                          introductionList[index].title,
                          style: isDark
                              ? AppStyle.regular20WhiteColorTextDarkMode
                              : AppStyle.regular20BlackColorTextLightMode,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          introductionList[index].content,
                          style: isDark
                              ? AppStyle.regular16SecTextDarkMode
                              : AppStyle.regular16SecTextLightMode,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    index == 0
                        ? OnboardingSettings(
                            isDark: isDark,
                            selectedLanguage: languageProvider.appLanguage,
                            selectedTheme: themeProvider.appTheme,
                            languageTitle: AppLocalizations.of(context)!.language,
                            englishText: AppLocalizations.of(context)!.english,
                            arabicText: AppLocalizations.of(context)!.arabic,
                            themeTitle: AppLocalizations.of(context)!.theme,
                            onEnglishSelected: () {
                              languageProvider.changeLanguage("en");
                            },
                            onArabicSelected: () {
                              languageProvider.changeLanguage("ar");
                            },
                            onLightSelected: () {
                              themeProvider.changeThemeMode(ThemeMode.light);
                            },
                            onDarkSelected: () {
                              themeProvider.changeThemeMode(ThemeMode.dark);
                            },
                          )
                        : SizedBox(),

                    AuthButton(
                      isDarkMode: isDark,
                      text: index == 0
                          ? AppLocalizations.of(context)!.letsStart
                          : index == 3
                          ? AppLocalizations.of(context)!.getStarted
                          : AppLocalizations.of(context)!.next,
                      onPressed: () {
                        if (currentPage < introductionList.length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {

                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginRouteName,
                          );
                          saveOnBoarDing();
                        }
                      },
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ],
            ),
          ),
        ),
        itemCount: introductionList.length,
      ),
    );
  }
 Future<void> saveOnBoarDing() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setBool('onBoarDing', true);

}

}
