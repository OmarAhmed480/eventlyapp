import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_styel.dart';
import '../../../../utils/generalbutton.dart';

class AuthButton extends StatelessWidget {
  final bool isDarkMode;
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.isDarkMode,
    required this.text,
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
        backgroundColor: isDarkMode
            ? AppColor.mainBlueColor
            : AppColor.blueColor,
        child: Text(
          text,
          style: AppStyle.medium20WhiteColor,
        ),
      ),
    );
  }
}