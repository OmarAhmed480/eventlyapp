import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final bool isDark;
  PageController pageController;
Future<void> saveOnBoarDing;
  OnboardingAppBar({
    super.key,
    required this.currentPage,
    required this.isDark,
    required this.pageController,
    required this.saveOnBoarDing
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDark ? AppColor.bGDarkMode : AppColor.bGLightMode,

      title: Image.asset(
        isDark ? AppAssets.eventty : AppAssets.eventty2,
        fit: BoxFit.fill,
      ),

      centerTitle: true,

      actions: [
        currentPage == 0 || currentPage == 3
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.loginRouteName,
                  );
                  saveOnBoarDing;
                },
                child: Padding(
                  padding: REdgeInsets.only(right: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: 63.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isDark
                            ? AppColor.strokeBlueColor
                            : AppColor.ofWhiteColor,
                        width: 1.w,
                      ),
                      color: isDark
                          ? AppColor.bGDarkMode
                          : AppColor.bGLightMode,
                    ),
                    child: Text(
                      "Skip",
                      style: isDark
                          ? AppStyle.semibold14mainBlueColor.copyWith(
                              color: AppColor.whiteColor,
                            )
                          : AppStyle.semibold14mainBlueColor.copyWith(
                              color: AppColor.blueColor,
                            ),
                    ),
                  ),
                ),
              ),
      ],

      leading: currentPage == 0 || currentPage == 1
          ? const SizedBox()
          : GestureDetector(
              onTap: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Padding(
                padding: REdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                child: Container(
                  padding: REdgeInsets.only(left: 9),
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isDark
                          ? AppColor.strokeBlueColor
                          : AppColor.ofWhiteColor,
                    ),
                    color: isDark
                        ? AppColor.inputsBlueDarkMode
                        : AppColor.whiteColor,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: isDark ? AppColor.whiteColor : AppColor.blueColor,
                  ),
                ),
              ),
            ),
    );
  }
}
