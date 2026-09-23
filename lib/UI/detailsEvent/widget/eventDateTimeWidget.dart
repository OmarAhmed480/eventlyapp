import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/app_theme_providers.dart';

class EventDateTimeWidget extends StatelessWidget {
  final AppThemeProviders themeProvider;
  final String date;
  final String time;

  const EventDateTimeWidget({
    super.key,
    required this.themeProvider,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      height: 76.h,
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
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: themeProvider.isDarkMode()
                    ? AppColor.strokeBlueColor
                    : AppColor.strokeWhiteColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: themeProvider.isDarkMode()
                  ? AppColor.bGDarkMode
                  : AppColor.bGLightMode,
            ),
            child: Image.asset(
              themeProvider.isDarkMode()
                  ? AppAssets.calendarAddDark
                  : AppAssets.calendarAdd,
            ),
          ),

          SizedBox(width: 16.w),

          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: themeProvider.isDarkMode()
                    ? AppStyle.medium16MainBlueColorDark
                    : AppStyle.medium16blackColorTextLightMode,
              ),
              Text(
                time,
                style: themeProvider.isDarkMode()
                    ? AppStyle.medium16MainBlueColorDark.copyWith(
                  color: AppColor.secTextDarkMode,
                )
                    : AppStyle.medium16blackColorTextLightMode.copyWith(
                  color: AppColor.ofWhiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}