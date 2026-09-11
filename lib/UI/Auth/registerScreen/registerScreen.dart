import 'package:eventlyapp/UI/Auth/registerScreen/widget/clreadyHaveAccountWidget.dart';
import 'package:eventlyapp/UI/Auth/registerScreen/widget/customAuthForm.dart';
import 'package:eventlyapp/UI/Auth/registerScreen/widget/googleAuthButton.dart';
import 'package:eventlyapp/UI/Auth/registerScreen/widget/orDividerWidget.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_routes.dart';
import '../loginScreen/widget/authButton.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController controllerName = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool isObscureConfirm = true;

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    confirmPassword.dispose();
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
                  AppLocalizations.of(context)!.createYourAccount,
                  style: themeProvider.isDarkMode()
                      ? AppStyle.semibold24whiteColor
                      : AppStyle.semibold24mainBlueColor.copyWith(
                          color: AppColor.blueColor,
                        ),
                ),

                CustomAuthForm(
                  controllerName: controllerName,
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                  confirmPassword: confirmPassword,
                  isObscure: isObscure,
                  isObscureConfirm: isObscureConfirm,
                  isDarkMode: themeProvider.isDarkMode(),

                  onPasswordVisibilityChanged: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },

                  onConfirmPasswordVisibilityChanged: () {
                    setState(() {
                      isObscureConfirm = !isObscureConfirm;
                    });
                  },
                ),
                AuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  text: AppLocalizations.of(context)!.signup,
                  onPressed: () {},
                ),
                SizedBox(height: 24.h),
                AuthFooterWidget(
                  isDarkMode: themeProvider.isDarkMode(),
                  message: AppLocalizations.of(context)!.alreadyHaveAnAccount,
                  actionText: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.loginRouteName,
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

                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
