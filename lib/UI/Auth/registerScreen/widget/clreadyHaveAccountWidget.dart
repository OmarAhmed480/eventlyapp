import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFooterWidget extends StatelessWidget {
  final bool isDarkMode;
  final String message;
  final String actionText;
  final VoidCallback onPressed;

  const AuthFooterWidget({
    super.key,
    required this.isDarkMode,
    required this.message,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: isDarkMode
                ? AppStyle.regular14SecondaryTextDark
                : AppStyle.regular14SecondaryTextLight,
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionText,
              style: isDarkMode
                  ? AppStyle.semibold14mainBlueColor
                  : AppStyle.semibold14mainBlueColor.copyWith(
                      color: AppColor.blueColor,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
