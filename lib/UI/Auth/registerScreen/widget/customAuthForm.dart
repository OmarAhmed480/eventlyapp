import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_validator.dart';
import '../../../../utils/custom_text_field.dart';

class CustomAuthForm extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController confirmPassword;

  final bool isObscure;
  final bool isObscureConfirm;
  final bool isDarkMode;

  final VoidCallback onPasswordVisibilityChanged;
  final VoidCallback onConfirmPasswordVisibilityChanged;

  const CustomAuthForm({
    super.key,
    required this.controllerName,
    required this.controllerEmail,
    required this.controllerPassword,
    required this.confirmPassword,
    required this.isObscure,
    required this.isObscureConfirm,
    required this.isDarkMode,
    required this.onPasswordVisibilityChanged,
    required this.onConfirmPasswordVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),

        CustomTextField(
          controller: controllerName,
          radius: 16.r,
          validator: AppValidators.validateName,
          borderSideColor: isDarkMode
              ? AppColor.strokeBlueColor
              : AppColor.ofWhiteColor,
          filled: true,
          fillColor: isDarkMode
              ? AppColor.inputsBlueDarkMode
              : AppColor.whiteColor,
          hintText: AppLocalizations.of(context)!.enterYourName,
          hintStyle: isDarkMode
              ? AppStyle.regular14secTextDarkMode
              : AppStyle.regular14secTextLightMode,
          keyboardType: TextInputType.name,
          prefixIcon: Image.asset(AppAssets.user),
        ),

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

        SizedBox(height: 24.h),

        CustomTextField(
          controller: confirmPassword,
          radius: 16.r,
          validator: (text) {
            return AppValidators.validateConfirmPassword(
              text,
              controllerPassword.text,
            );
          },
          borderSideColor: isDarkMode
              ? AppColor.strokeBlueColor
              : AppColor.ofWhiteColor,
          filled: true,
          fillColor: isDarkMode
              ? AppColor.inputsBlueDarkMode
              : AppColor.whiteColor,
          hintText: AppLocalizations.of(context)!.confirmYourPassword,
          hintStyle: isDarkMode
              ? AppStyle.regular14secTextDarkMode
              : AppStyle.regular14secTextLightMode,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Image.asset(AppAssets.lock),
          suffixIcon: GestureDetector(
            onTap: onConfirmPasswordVisibilityChanged,
            child: Icon(
              isObscureConfirm
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColor.ofWhiteColor,
            ),
          ),
          obscureText: isObscureConfirm,
        ),

        SizedBox(height: 52.h),
      ],
    );
  }
}