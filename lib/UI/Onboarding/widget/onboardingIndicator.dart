import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicator extends StatelessWidget {
  final int index;
  final bool isDark;

  const OnboardingIndicator({
    super.key,
    required this.index,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: i == index ? 20.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: i == index
                ? (isDark
                ? const Color(0xFF457AED)
                : const Color(0xFF0E3A99))
                : (isDark
                ? const Color(0xFFF4F7FF)
                : const Color(0xFFB9B9B9)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}