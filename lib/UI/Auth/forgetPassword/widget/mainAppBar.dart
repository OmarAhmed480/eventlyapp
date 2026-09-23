import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback? onBackPressed;

  const MainAppBar({
    super.key,
    required this.title,
    required this.isDarkMode,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      title: Text(
        title,
        style: isDarkMode
            ? AppStyle.medium14blackColorTextDarkMode.copyWith(
          color: AppColor.whiteColor,
        )
            : AppStyle.medium14blackColorTextDarkMode,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: onBackPressed ??
                () {
              Navigator.of(context).pop();
            },
        child: Padding(
          padding: REdgeInsets.only(
            left: 8,
            top: 8,
            right: 8,
            bottom: 8,
          ),
          child: Container(
            padding: REdgeInsets.only(left: 9),
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isDarkMode
                    ? AppColor.strokeBlueColor
                    : AppColor.ofWhiteColor,
              ),
              color: isDarkMode
                  ? AppColor.inputsBlueDarkMode
                  : AppColor.whiteColor,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: isDarkMode
                  ? AppColor.whiteColor
                  : AppColor.blueColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}