import 'package:eventlyapp/UI/Auth/loginScreen/loginScreen.dart';
import 'package:eventlyapp/UI/detailsEvent/detailsEvent.dart';
import 'package:eventlyapp/providers/app_language_providers.dart';
import 'package:eventlyapp/providers/app_theme_providers.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'UI/AddEvent/addEvent.dart';
import 'UI/Auth/forgetPassword/forgetPassword.dart';
import 'UI/Auth/registerScreen/registerScreen.dart';
import 'UI/Onboarding/OnboardingScreen.dart';
import 'UI/editEvent/editEvent.dart';
import 'UI/home/homeScreen.dart';
import 'UI/splashScreen/splashScreen.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguageProviders()),
        ChangeNotifierProvider(create: (_) => AppThemeProviders()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  const  MyApp({super.key,});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    var themeProviders = Provider.of<AppThemeProviders>(context);
    var languageProvider = Provider.of<AppLanguageProviders>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashRouteName,
        routes: {
          AppRoutes.splashRouteName: (context) => SplashScreen(),
          AppRoutes.onBoardinRouteName: (context) => OnBoarDingScreen(),
          AppRoutes.loginRouteName: (context) => LoginScreen(),
          AppRoutes.registerRouteName: (context) => RegisterScreen(),
          AppRoutes.forgetRouteName: (context) => ForgetPassword(),
          AppRoutes.homeRouteName: (context) => HomeScreen(),
          AppRoutes.addEventRouteName: (context) => AddEvent(),
          AppRoutes.detailsEventRouteName: (context) => DetailsEvent(),
          AppRoutes.editEventRouteName: (context) => EditeVent(),
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(languageProvider.appLanguage),
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        themeMode: themeProviders.appTheme,
      ),
    );
  }

  void initSharedPreferences() async {
    final languageProvider = Provider.of<AppLanguageProviders>(
      context,
      listen: false,
    );

    final themeProviders = Provider.of<AppThemeProviders>(
      context,
      listen: false,
    );
    // var userProvider=Provider.of<UserProvider>(context,  listen: false,);

    await languageProvider.loadLanguage();
    await themeProviders.loadTheme();
    // await userProvider.loadUserData();
  }
}
