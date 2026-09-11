import 'package:eventlyapp/UI/TabList/HomeTab/widget/tab_widget.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCategoryList extends StatelessWidget {
  final List<String> eventsNameList;
  final int selectedIndex;
  final bool isDarkMode;
  final ValueChanged<int> onSelected;

  const EventCategoryList({
    super.key,
    required this.eventsNameList,
    required this.selectedIndex,
    required this.isDarkMode,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onSelected(index);
            },
            child: TabWidget(
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
              isSelected: selectedIndex == index,
              eventsName: eventsNameList[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8.w);
        },
        itemCount: eventsNameList.length,
      ),
    );
  }
}
