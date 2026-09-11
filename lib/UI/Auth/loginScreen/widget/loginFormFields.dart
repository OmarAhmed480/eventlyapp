import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_styel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_validator.dart';
import '../../../../utils/custom_text_field.dart';

class LoginFormFields extends StatelessWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  final bool isDarkMode;
  final bool isObscure;

  final VoidCallback onPasswordVisibilityChanged;
  final VoidCallback onForgetPasswordPressed;

  const LoginFormFields({
    super.key,
    required this.controllerEmail,
    required this.controllerPassword,
    required this.isDarkMode,
    required this.isObscure,
    required this.onPasswordVisibilityChanged,
    required this.onForgetPasswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),

        CustomTextField(
          controller: controllerEmail,
          radius: 16.r,
          validator: AppValidators.validateEmail,
          borderSideColor: isDarkMode
              ? AppColor.strokeBlueColor
              : AppColor.ofWhiteColor,
          filled: true,
          fillColor: isDarkMode
              ? AppColor.inputsBlueDarkMode
              : AppColor.whiteColor,
          hintText: AppLocalizations.of(context)!.enterYourEmail,
          hintStyle: isDarkMode
              ? AppStyle.regular14secTextDarkMode
              : AppStyle.regular14secTextLightMode,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Image.asset(AppAssets.sms),
        ),

        SizedBox(height: 24.h),

        CustomTextField(
          controller: controllerPassword,
          radius: 16.r,
          validator: AppValidators.validatePassword,
          borderSideColor: isDarkMode
              ? AppColor.strokeBlueColor
              : AppColor.ofWhiteColor,
          filled: true,
          fillColor: isDarkMode
              ? AppColor.inputsBlueDarkMode
              : AppColor.whiteColor,
          hintText: AppLocalizations.of(context)!.enterYourPassword,
          hintStyle: isDarkMode
              ? AppStyle.regular14secTextDarkMode
              : AppStyle.regular14secTextLightMode,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Image.asset(AppAssets.lock),
          suffixIcon: GestureDetector(
            onTap: onPasswordVisibilityChanged,
            child: Icon(
              isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColor.ofWhiteColor,
            ),
          ),
          obscureText: isObscure,
        ),

        SizedBox(height: 8.h),

        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: onForgetPasswordPressed,
            child: Text(
              AppLocalizations.of(context)!.forgetPassword,
              style: isDarkMode
                  ? AppStyle.semibold14mainBlueColor
                  : AppStyle.semibold14whiteColor.copyWith(
                      color: AppColor.blueColor,
                    ),
            ),
          ),
        ),

        SizedBox(height: 47.h),
      ],
    );
  }
}
