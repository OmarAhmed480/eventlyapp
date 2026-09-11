import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_styel.dart';



class SettingsItem extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDark;

  const SettingsItem({
    super.key,
    required this.title,
    required this.isDark,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 15.w),
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isDark ? AppColor.mainBlueColor : AppColor.strokeWhiteColor,
          ),
          color: isDark ? AppColor.inputsBlueDarkMode : AppColor.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: isDark
                  ? AppStyle.medium16whiteColorTextDarkMode
                  : AppStyle.medium16blackColorTextLightMode,
            ),

            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
