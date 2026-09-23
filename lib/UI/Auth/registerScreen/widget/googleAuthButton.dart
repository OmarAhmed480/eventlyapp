import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generailWidget/generalbutton.dart';



class GoogleAuthButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;

  const GoogleAuthButton({
    super.key,
    required this.isDarkMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: GeneralButton(
        onPressed: onPressed,
        radiusCircular: 16.r,
        backgroundColor: isDarkMode ? AppColor.blueColor : AppColor.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googel, fit: BoxFit.fill),

            SizedBox(width: 16.w),

            Text(
              AppLocalizations.of(context)!.signUpWithGoogle,
              style: isDarkMode
                  ? AppStyle.medium18blueColorDarkMode.copyWith(
                      color: AppColor.mainBlueColor,
                    )
                  : AppStyle.medium18blueColorDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}
