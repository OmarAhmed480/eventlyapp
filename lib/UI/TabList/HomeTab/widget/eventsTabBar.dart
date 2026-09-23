import 'package:eventlyapp/UI/TabList/HomeTab/widget/tab_widget.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsTabBar extends StatelessWidget {
  final List<String> eventsNameList;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isDarkMode;

  const EventsTabBar({
    super.key,
    required this.eventsNameList,
    required this.selectedIndex,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: eventsNameList.length,
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: REdgeInsets.symmetric(horizontal: 3.w),
        onTap: onTap,
        tabs: eventsNameList.asMap().entries.map((entry) {
          final index = entry.key;
          final eventsName = entry.value;

          return TabWidget(

            selectedTextColor: AppStyle.medium16whiteColorTextDarkMode,

            unselectedTextColor: isDarkMode
                ? AppStyle.medium16whiteColorTextDarkMode
                : AppStyle.medium16mainBlackColorTextLightMode,

            selectedColor: isDarkMode
                ? AppColor.mainBlueColor
                : AppColor.blueColor,

            unselectedColor: isDarkMode
                ? AppColor.inputsBlueDarkMode
                : AppColor.whiteColor,

            eventsName: eventsName,
            isSelected: selectedIndex == index,
          );
        }).toList(),
      ),
    );
  }
}
