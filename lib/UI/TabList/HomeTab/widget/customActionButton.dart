import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActionButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;
  final Color selectedColor;

  const CustomActionButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.child,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 34.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected ? selectedColor : Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
