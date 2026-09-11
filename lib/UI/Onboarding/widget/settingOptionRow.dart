import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOptionRow extends StatelessWidget {
  final String title;
  final List<Widget> options;
  final double spacing;
  final bool isDarkMode;

  SettingOptionRow({
    super.key,
    required this.title,
    required this.options,
    required this.spacing,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: isDarkMode
              ? AppStyle.medium20whiteColorTextDarkMode
              : AppStyle.medium18blueColorDarkMode,
        ),

        SizedBox(width: spacing.w),

        ...options,
      ],
    );
  }
}

class SettingOptionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isDarkMode;
  final bool isSelected;
  final double width;

  const SettingOptionButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.isDarkMode,
    required this.isSelected,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        alignment: Alignment.center,
        height: 32.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected
              ? (isDarkMode ? const Color(0xFF457AED) : const Color(0xFF0E3A99))
              : (isDarkMode
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : (isDarkMode
                      ? AppColor.strokeBlueColor
                      : AppColor.ofWhiteColor),
          ),
        ),
        child: child,
      ),
    );
  }
}
