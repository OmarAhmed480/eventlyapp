import 'package:eventlyapp/model/event.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_providers.dart';
import '../../../../utils/app_routes.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.eventDate,
    required this.eventTitle,
    required this.eventImage,

    required this.onFavoritePressed,

    required this.event
  });
final Event event;
  final String eventImage;
  final String eventDate;
  final String eventTitle;


  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);

    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(context, AppRoutes.detailsEventRouteName,arguments:event );
      },
      child: Container(
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
            image: AssetImage(eventImage),
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

            const Spacer(),

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
                      child: Text(
                        eventTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: themeProvider.isDarkMode()
                            ? AppStyle.medium14whiteColorTextDarkMode
                            : AppStyle.medium14blackColorTextDarkMode,
                      ),
                    ),

                    SizedBox(width: 15.w),

                    IconButton(
                      onPressed: onFavoritePressed,
                      icon: Icon(
                        event.isFavorite? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25.sp,
                        color: AppColor.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
