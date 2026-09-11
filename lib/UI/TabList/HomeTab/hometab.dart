import 'package:eventlyapp/UI/TabList/HomeTab/widget/customActionButton.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/event_item.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/tab_widget.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/welcomeUserWidget.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_providers.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_color.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
 bool isSelectedHart=false;
  int isSelected = 0;
  int selectedIndex = 0;
  List<Widget> filterList = [];

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProviders>(context);
    var eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.eating,
    ];

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8.w),
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColor.bGDarkMode
            : AppColor.bGLightMode,
        appBar: AppBar(
          backgroundColor: themeProvider.isDarkMode()
              ? AppColor.bGDarkMode
              : AppColor.bGLightMode,
          title: WelcomeUserWidget(userName: "John Safwat"),
          actions: [
            CustomActionButton(
              isSelected: isSelected == 2,
              selectedColor: themeProvider.isDarkMode()
                  ? AppColor.mainBlueColor
                  : AppColor.blueColor,
              onTap: () {
                isSelected = 2;
                themeProvider.changeThemeMode(
                  themeProvider.isDarkMode() ? ThemeMode.light : ThemeMode.dark,
                );
                setState(() {});
              },
              child: Image.asset(
                themeProvider.isDarkMode() ? AppAssets.moon : AppAssets.sun,
                color: themeProvider.isDarkMode()
                    ? AppColor.blueColor
                    : AppColor.mainBlueColor,
                fit: BoxFit.fill,
              ),
            ),
            CustomActionButton(
              isSelected: isSelected == 1,
              selectedColor: themeProvider.isDarkMode()
                  ? AppColor.mainBlueColor
                  : AppColor.blueColor,
              onTap: () {
                isSelected = 1;
                languageProvider.changeLanguage(
                  languageProvider.appLanguage == "en" ? "ar" : "en",
                );

                setState(() {});
              },
              child: Text(
                languageProvider.appLanguage == "en" ? "EN" : "Ar",
                style: themeProvider.isDarkMode()
                    ? AppStyle.semibold14whiteColor
                    : AppStyle.semibold14whiteColor.copyWith(
                        color: AppColor.blackColor,
                      ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            DefaultTabController(
              length: eventsNameList.length,
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: REdgeInsets.symmetric(horizontal: 3.w),

                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                tabs: eventsNameList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final eventsName = entry.value;

                  return TabWidget(
                    selectedTextColor: AppStyle.medium16whiteColorTextDarkMode,

                    unselectedTextColor: themeProvider.isDarkMode()
                        ? AppStyle.medium16whiteColorTextDarkMode
                        : AppStyle.medium16mainBlackColorTextLightMode,

                    selectedColor: themeProvider.isDarkMode()
                        ? AppColor.mainBlueColor
                        : AppColor.blueColor,

                    unselectedColor: themeProvider.isDarkMode()
                        ? AppColor.inputsBlueDarkMode
                        : AppColor.whiteColor,

                    eventsName: eventsName,

                    isSelected: selectedIndex == index,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.builder(

                itemCount: 1,
                itemBuilder: (context, index) {
                  return EventItem(
                    eventDate: "21,Sep",
                    eventTitle: "Meeting for Updating The Development Method ",
                    isSelected:isSelectedHart,
                    onFavoritePressed: () {
                      isSelectedHart=!isSelectedHart;
                      setState(() {

                      });
                    },
                    eventImageLite:AppAssets.birthdayDark,
                    eventImageDark:AppAssets.birthdayLite,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
