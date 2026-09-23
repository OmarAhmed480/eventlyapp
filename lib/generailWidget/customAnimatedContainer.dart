import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  final bool isActive;

  final double widthActive;
  final double widthUnActive;

  final double heightActive;
  final double heightUnActive;

  // Active Colors
  final Color activeLightColor;
  final Color activeDarkColor;

  // UnActive Colors
  final Color unActiveLightColor;
  final Color unActiveDarkColor;

  final BorderRadius borderRadiusActive;
  final BorderRadius borderRadiusUnActive;

  final bool isDark;

  const CustomAnimatedContainer({
    super.key,
    required this.isActive,
    required this.widthActive,
    required this.widthUnActive,
    required this.heightActive,
    required this.heightUnActive,
    required this.activeLightColor,
    required this.activeDarkColor,
    required this.unActiveLightColor,
    required this.unActiveDarkColor,
    required this.borderRadiusActive,
    required this.borderRadiusUnActive,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? widthActive : widthUnActive,
      height: isActive ? heightActive : heightUnActive,
      decoration: BoxDecoration(
        color: isActive
            ? (isDark ? activeDarkColor : activeLightColor)
            : (isDark ? unActiveDarkColor : unActiveLightColor),
        borderRadius: isActive
            ? borderRadiusActive
            : borderRadiusUnActive,
      ),
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  final double paddingHorizontal;

  final double widthActive;
  final double widthUnActive;

  final double heightActive;
  final double heightUnActive;

  final Color activeLightColor;
  final Color activeDarkColor;

  final Color unActiveLightColor;
  final Color unActiveDarkColor;

  final BorderRadius borderRadiusActive;
  final BorderRadius borderRadiusUnActive;

  final bool isDark;

  const CustomPageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
    required this.paddingHorizontal,
    required this.widthActive,
    required this.widthUnActive,
    required this.heightActive,
    required this.heightUnActive,
    required this.activeLightColor,
    required this.activeDarkColor,
    required this.unActiveLightColor,
    required this.unActiveDarkColor,
    required this.borderRadiusActive,
    required this.borderRadiusUnActive,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (indicatorIndex) {
          final isActive = currentPage == indicatorIndex;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
            ),
            child: CustomAnimatedContainer(
              isActive: isActive,
              widthActive: widthActive,
              widthUnActive: widthUnActive,
              heightActive: heightActive,
              heightUnActive: heightUnActive,
              activeLightColor: activeLightColor,
              activeDarkColor: activeDarkColor,
              unActiveLightColor: unActiveLightColor,
              unActiveDarkColor: unActiveDarkColor,
              borderRadiusActive: borderRadiusActive,
              borderRadiusUnActive: borderRadiusUnActive,
              isDark: isDark,
            ),
          );
        },
      ),
    );
  }
}