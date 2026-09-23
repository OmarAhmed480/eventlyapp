import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/app_language_providers.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_assets.dart';

class EventAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppThemeProviders themeProvider;
  final AppLanguageProviders languageProvider;
  final String title;
  final bool showEditButton;
  final bool showDeleteButton;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const EventAppBar({
    super.key,
    required this.themeProvider,
    required this.languageProvider,
    required this.title,
    this.showEditButton = false,
    this.showDeleteButton = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: themeProvider.isDarkMode()
            ? AppColor.whiteColor
            : AppColor.blueColor,
      ),
      title: Text(
        title,
        style: themeProvider.isDarkMode()
            ? AppStyle.medium18whiteColorDarkMode
            : AppStyle.medium18blackColorTextDarkMode,
      ),
      leading: Padding(
        padding: REdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: languageProvider.appLanguage == "en"
                ? REdgeInsets.only(left: 10.w)
                : REdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: themeProvider.isDarkMode()
                    ? AppColor.strokeBlueColor
                    : AppColor.strokeWhiteColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: themeProvider.isDarkMode()
                  ? AppColor.inputsBlueDarkMode
                  : AppColor.whiteColor,
            ),
            child: Icon(Icons.arrow_back_ios, size: 25.sp),
          ),
        ),
      ),
      actions: [
        if (showEditButton)
          GestureDetector(
            onTap: onEdit,
            child: Container(
              height: 32.h,
              width: 32.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.w,
                  color: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.strokeWhiteColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: themeProvider.isDarkMode()
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
              ),
              child: Image.asset(
                AppAssets.edit,
                color: themeProvider.isDarkMode()
                    ? AppColor.mainBlueColor
                    : AppColor.blueColor,
                fit: BoxFit.fill,
              ),
            ),
          ),
        if (showEditButton && showDeleteButton) SizedBox(width: 8.w),
        if (showDeleteButton)
          GestureDetector(
            onTap: onDelete,
            child: Container(
              height: 32.h,
              width: 32.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.w,
                  color: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.strokeWhiteColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
                color: themeProvider.isDarkMode()
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
              ),
              child: Image.asset(
                AppAssets.delete,
                color: AppColor.redColor,
                fit: BoxFit.fill,
              ),
            ),
          ),
        if (showEditButton || showDeleteButton) SizedBox(width: 16.w),
      ],
    );
  }
}
