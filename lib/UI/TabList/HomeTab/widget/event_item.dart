import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_providers.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.eventImageLite,
    required this.eventDate,
    required this.eventTitle,
    required this.isSelected,
    this.onFavoritePressed,
    required this.eventImageDark,
  });

  final String eventImageDark;

  final String eventImageLite;
  final String eventDate;
  final String eventTitle;
  final bool isSelected;
  final VoidCallback? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);

    return Container(
      margin: REdgeInsets.symmetric(vertical: 8.h),
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 2.w,
          color: themeProvider.isDarkMode()
              ? AppColor.strokeBlueColor
              : AppColor.strokeWhiteColor,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            themeProvider.isDarkMode() ? eventImageLite : eventImageDark,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: REdgeInsets.symmetric(vertical: 10.r, horizontal: 10.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: themeProvider.isDarkMode()
                    ? AppColor.strokeBlueColor
                    : AppColor.ofWhiteColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: themeProvider.isDarkMode()
                  ? AppColor.bGDarkMode
                  : AppColor.bGLightMode,
            ),
            height: 40.h,
            width: 75.w,
            child: Text(
              eventDate,
              style: themeProvider.isDarkMode()
                  ? AppStyle.semibold14whiteColor.copyWith(
                      color: AppColor.blueColor,
                      fontSize: 16.sp,
                    )
                  : AppStyle.semibold14whiteColor.copyWith(
                      color: AppColor.mainBlueColor,
                      fontSize: 16.sp,
                    ),
            ),
          ),
          Spacer(),
          Container(
            margin: REdgeInsets.symmetric(vertical: 10.r, horizontal: 10.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: themeProvider.isDarkMode()
                    ? AppColor.strokeBlueColor
                    : AppColor.ofWhiteColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: themeProvider.isDarkMode()
                  ? AppColor.bGDarkMode
                  : AppColor.bGLightMode,
            ),
            height: 50.h,
            width: double.infinity,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        eventTitle,
                        style: themeProvider.isDarkMode()
                            ? AppStyle.medium14whiteColorTextDarkMode
                            : AppStyle.medium14blackColorTextDarkMode,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onFavoritePressed,
                    child: Image.asset(
                      isSelected ? AppAssets.heartSelected : AppAssets.heart,
                      color: AppColor.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
