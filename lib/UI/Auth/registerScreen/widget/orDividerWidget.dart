import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_styel.dart';

class OrDividerWidget extends StatelessWidget {
  final bool isDarkMode;

  const OrDividerWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDarkMode
                ? AppColor.strokeBlueColor
                : AppColor.ofWhiteColor,
            endIndent: 16.w,
          ),
        ),

        Text(
          AppLocalizations.of(context)!.or,
          style: isDarkMode
              ? AppStyle.medium16MainBlueColorDark
              : AppStyle.medium16BlueColorLight,
        ),

        Expanded(
          child: Divider(
            color: isDarkMode
                ? AppColor.strokeBlueColor
                : AppColor.ofWhiteColor,
            indent: 16.w,
          ),
        ),
      ],
    );
  }
}
