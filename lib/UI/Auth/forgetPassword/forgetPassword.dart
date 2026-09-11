import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_color.dart';
import '../loginScreen/widget/authButton.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColor.bGDarkMode
            : AppColor.bGLightMode,
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: themeProvider.isDarkMode()
              ? AppStyle.medium14blackColorTextDarkMode.copyWith(
                  color: AppColor.whiteColor,
                )
              : AppStyle.medium14blackColorTextDarkMode,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: REdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
            child: Container(
              padding: REdgeInsets.only(left: 9),
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.ofWhiteColor,
                ),
                color: themeProvider.isDarkMode()
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: themeProvider.isDarkMode()
                    ? AppColor.whiteColor
                    : AppColor.blueColor,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
        child: Column(
          children: [
            Image.asset(
              themeProvider.isDarkMode()
                  ? AppAssets.eingCreative5
                  : AppAssets.changeSetting,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 32.h),
            AuthButton(
              isDarkMode: themeProvider.isDarkMode(),
              text: AppLocalizations.of(context)!.resetPassword,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
