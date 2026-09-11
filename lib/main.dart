import 'package:eventlyapp/UI/Auth/loginScreen/loginScreen.dart';
import 'package:eventlyapp/providers/app_language_providers.dart';
import 'package:eventlyapp/providers/app_theme_providers.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'UI/AddEvent/addEvent.dart';
import 'UI/Auth/forgetPassword/forgetPassword.dart';
import 'UI/Auth/registerScreen/registerScreen.dart';
import 'UI/Onboarding/OnboardingScreen.dart';
import 'UI/home/homeScreen.dart';
import 'UI/splashScreen/splashScreen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AppLanguageProviders()),
        ChangeNotifierProvider(create: (_)=>AppThemeProviders()),

      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProviders=Provider.of<AppThemeProviders>(context);
    var languageProvider = Provider.of<AppLanguageProviders>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashRouteName,
        routes: {
          AppRoutes.onBoardinRouteName: (context) =>OnBoarDingScreen(),
          AppRoutes.splashRouteName: (context) =>SplashScreen(),
          AppRoutes.homeRouteName: (context) => HomeScreen(),
          AppRoutes.registerRouteName: (context) => RegisterScreen(),
          AppRoutes.loginRouteName: (context) => LoginScreen(),

          AppRoutes.forgetRouteName: (context) => ForgetPassword(),
          AppRoutes.addEventRouteName: (context) => AddEvent(),
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(languageProvider.appLanguage),
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        themeMode:themeProviders.appTheme,
      ),
    );
  }
}
