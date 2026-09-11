import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_providers.dart';
import '../TabList/ HeartTab/heart_tab.dart';
import '../TabList/HomeTab/hometab.dart';
import '../TabList/ProfileTab/profiletab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [HomeTab(), HeartTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        backgroundColor: themeProvider.isDarkMode()
            ? AppColor.mainBlueColor
            : AppColor.blueColor,
        child: Icon(Icons.add, color: AppColor.whiteColor, size: 25),
      ),

      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          backgroundColor: themeProvider.isDarkMode()
              ? AppColor.bGDarkMode
              : AppColor.bGLightMode,
          unselectedLabelStyle: AppStyle.regular12ofWhiteColorLightMode,
          selectedLabelStyle: AppStyle.regular12mainBlueColorLightMode,
          unselectedItemColor: AppColor.ofWhiteColor,
          selectedItemColor: AppColor.blueColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            bottomNavigationBar(
              label: AppLocalizations.of(context)!.home,
              iconSelected: AppAssets.homeSelected,
              iconUnselected: AppAssets.home,
              index: 0,
            ),
            bottomNavigationBar(
              label: AppLocalizations.of(context)!.favorite,
              iconSelected: AppAssets.heartSelected,
              iconUnselected: AppAssets.heart,
              index: 1,
            ),
            bottomNavigationBar(
              label: AppLocalizations.of(context)!.profile,
              iconSelected: AppAssets.userSelected,
              iconUnselected: AppAssets.user,
              index: 2,
            ),
          ],
        ),
      ),

      body: Expanded(child: tabList[selectedIndex]),
    );
  }

  BottomNavigationBarItem bottomNavigationBar({
    required String label,
    required String iconSelected,
    required String iconUnselected,

    required int index,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: selectedIndex == index
          ? Image.asset(iconSelected)
          : Image.asset(iconUnselected),
    );
  }
}
