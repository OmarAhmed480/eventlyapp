import 'package:eventlyapp/UI/Auth/forgetPassword/widget/mainAppBar.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../generailWidget/app_validator.dart';
import '../../../generailWidget/custom_text_field.dart';
import '../../../generailWidget/function/dialogUtils.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_routes.dart';
import '../loginScreen/widget/authButton.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController controllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      appBar: MainAppBar(
      title: "Forget Password",
      isDarkMode: themeProvider.isDarkMode(),
      onBackPressed: () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.loginRouteName,
        );
      },
    ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
        child: Form(
          key:formKey ,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.eingCreative5
                      : AppAssets.changeSetting,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  textStyle: themeProvider.isDarkMode()
                      ? AppStyle.regular14secTextDarkMode
                      : AppStyle.regular14secTextLightMode.copyWith(
                          color: AppColor.blackColor,
                        ),
                  controller: controllerEmail,
                  radius: 16.r,
                  validator: AppValidators.validateEmail,
                  borderSideColor: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.ofWhiteColor,
                  filled: true,
                  fillColor: themeProvider.isDarkMode()
                      ? AppColor.inputsBlueDarkMode
                      : AppColor.whiteColor,
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                  hintStyle: themeProvider.isDarkMode()
                      ? AppStyle.regular14secTextDarkMode
                      : AppStyle.regular14secTextLightMode,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Image.asset(AppAssets.sms),
                ),
                SizedBox(height: 32.h),
                AuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  text: AppLocalizations.of(context)!.resetPassword,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        DialogUtils.showLoadingDialog(context: context);
                        await  FirebaseAuth.instance.sendPasswordResetEmail(
                          email: controllerEmail.text.trim(),
                        );
                        Navigator.pop(context);
                        DialogUtils.toastMsg(
                            msg:  AppLocalizations.of(context)!.mailSent,
                            backgroundColor:AppColor.whiteColor,
                            textColor: AppColor.blackColor);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          await DialogUtils.showMessageDialog(
                            showOkButton: true,
                            context: context,
                            onPressedOk: () {
                              Navigator.of(context).pop();
                            },
                            text: AppLocalizations.of(context)!.noUserFound,
                          );
                        }
                      }
                    }
            
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
