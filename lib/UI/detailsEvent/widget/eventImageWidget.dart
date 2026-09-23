import 'package:eventlyapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/app_theme_providers.dart';

class EventImageWidget extends StatelessWidget {
  final AppThemeProviders themeProvider;
  final String eventImage;

  const EventImageWidget({
    super.key,
    required this.themeProvider,
    required this.eventImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 193.h,
        width: 343.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: themeProvider.isDarkMode()
                ? AppColor.strokeBlueColor
                : AppColor.strokeWhiteColor,
          ),
        ),
        child: Image.asset(
          eventImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}