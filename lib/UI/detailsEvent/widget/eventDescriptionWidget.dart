import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/app_theme_providers.dart';

class EventDescriptionWidget extends StatelessWidget {
  final AppThemeProviders themeProvider;
  final String description;

  const EventDescriptionWidget({
    super.key,
    required this.themeProvider,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      height: 179.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: themeProvider.isDarkMode()
              ? AppColor.strokeBlueColor
              : AppColor.strokeWhiteColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
        color: themeProvider.isDarkMode()
            ? AppColor.bGDarkMode
            : AppColor.whiteColor,
      ),
      child: Text(
        description,
        textAlign: TextAlign.start,
        overflow: TextOverflow.visible,
        style: themeProvider.isDarkMode()
            ? AppStyle.regular14secTextDarkMode
            : AppStyle.regular14secTextLightMode.copyWith(
          color: AppColor.blackColor,
        ),
      ),
    );
  }
}