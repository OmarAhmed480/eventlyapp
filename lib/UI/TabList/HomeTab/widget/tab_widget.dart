
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  TabWidget({
    super.key,
    required this.isSelected,
    required this.eventsName,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  bool isSelected;
  String eventsName;


  Color selectedColor;
  Color unselectedColor;
  TextStyle selectedTextColor;
  TextStyle unselectedTextColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:  15.w,
        vertical:10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        color: isSelected?
        selectedColor:
        unselectedColor,

        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : Theme.of(context).disabledColor,
          width: 1.w,
        ),
      ),
      child: Text(
        eventsName,
        style: isSelected?
        selectedTextColor:
        unselectedTextColor

      ),
    );
  }
}
