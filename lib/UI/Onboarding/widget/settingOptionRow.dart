import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOptionRow extends StatelessWidget {
  final String title;
  final List<Widget> options;

  final bool isDarkMode;

  SettingOptionRow({
    super.key,
    required this.title,
    required this.options,

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

        Spacer(),

        ...options,
      ],
    );
  }
}



class CustomActionButton extends StatelessWidget {
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  final double width;
  final double height;
  final double borderWidth;
  final double borderRadius;

  // Light Mode - Selected
  final Color selectedLightContainerColor;
  final Color selectedLightBorderColor;
  final TextStyle selectedLightTextStyle;

  // Light Mode - Unselected
  final Color unSelectedLightContainerColor;
  final Color unSelectedLightBorderColor;
  final TextStyle unSelectedLightTextStyle;

  // Dark Mode - Selected
  final Color selectedDarkContainerColor;
  final Color selectedDarkBorderColor;
  final TextStyle selectedDarkTextStyle;

  // Dark Mode - Unselected
  final Color unSelectedDarkContainerColor;
  final Color unSelectedDarkBorderColor;
  final TextStyle unSelectedDarkTextStyle;

  final Widget child;

  const CustomActionButton({
    super.key,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.borderRadius,
    required this.selectedLightContainerColor,
    required this.selectedLightBorderColor,
    required this.selectedLightTextStyle,
    required this.unSelectedLightContainerColor,
    required this.unSelectedLightBorderColor,
    required this.unSelectedLightTextStyle,
    required this.selectedDarkContainerColor,
    required this.selectedDarkBorderColor,
    required this.selectedDarkTextStyle,
    required this.unSelectedDarkContainerColor,
    required this.unSelectedDarkBorderColor,
    required this.unSelectedDarkTextStyle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color containerColor = isDark
        ? (isSelected
        ? selectedDarkContainerColor
        : unSelectedDarkContainerColor)
        : (isSelected
        ? selectedLightContainerColor
        : unSelectedLightContainerColor);

    final Color borderColor = isDark
        ? (isSelected
        ? selectedDarkBorderColor
        : unSelectedDarkBorderColor)
        : (isSelected
        ? selectedLightBorderColor
        : unSelectedLightBorderColor);

    final TextStyle textStyle = isDark
        ? (isSelected
        ? selectedDarkTextStyle
        : unSelectedDarkTextStyle)
        : (isSelected
        ? selectedLightTextStyle
        : unSelectedLightTextStyle);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: Container(
        alignment: Alignment.center,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth.w,
            color: borderColor,
          ),
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: DefaultTextStyle(
          style: textStyle,
          child: child,
        ),
      ),
    );
  }
}
