import 'package:eventlyapp/UI/Auth/loginScreen/widget/authButton.dart';
import 'package:eventlyapp/UI/Auth/loginScreen/widget/loginFormFields.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:eventlyapp/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/custom_text_field.dart';
import '../../../utils/generalbutton.dart';
import '../registerScreen/widget/clreadyHaveAccountWidget.dart';
import '../registerScreen/widget/googleAuthButton.dart';
import '../registerScreen/widget/orDividerWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 64.h),
                Center(
                  child: Image.asset(
                    themeProvider.isDarkMode()
                        ? AppAssets.eventty
                        : AppAssets.eventty2,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  AppLocalizations.of(context)!.loginToYourAccount,
                  style: themeProvider.isDarkMode()
                      ? AppStyle.semibold24whiteColor
                      : AppStyle.semibold24mainBlueColor.copyWith(
                          color: AppColor.blueColor,
                        ),
                ),
                LoginFormFields(
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                  isDarkMode: themeProvider.isDarkMode(),
                  isObscure: isObscure,

                  onPasswordVisibilityChanged: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },

                  onForgetPasswordPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.forgetRouteName);
                  },
                ),
                AuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    signIn();
                  },
                ),
                SizedBox(height: 48.h),
                AuthFooterWidget(
                  isDarkMode: themeProvider.isDarkMode(),
                  message: AppLocalizations.of(context)!.dontHaveAnAccount,
                  actionText: AppLocalizations.of(context)!.signup,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.registerRouteName,
                    );
                  },
                ),
                SizedBox(height: 32.h),
                OrDividerWidget( isDarkMode: themeProvider.isDarkMode(), ),
                SizedBox(height: 32.h),
                GoogleAuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  onPressed: () {},
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
    }
  }
}
