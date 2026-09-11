import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_providers.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/custom_text_field.dart';
import '../HomeTab/widget/event_item.dart';

class HeartTab extends StatefulWidget {
 HeartTab({super.key});

  @override
  State<HeartTab> createState() => _HeartTabState();
}

class _HeartTabState extends State<HeartTab> {
  bool isSelectedHart=false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColor.bGDarkMode
            : AppColor. bGLightMode,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal:8.w,),
          child: Column(
            children: [
              CustomTextField(
                keyboardType: TextInputType.name,
                hintText: AppLocalizations.of(context)!.searchForEvent,
                hintStyle: themeProvider.isDarkMode()
                    ? AppStyle.regular14secTextDarkMode
                    : AppStyle.regular14secTextLightMode,
              borderSideColor: themeProvider.isDarkMode()
                  ?AppColor.strokeBlueColor:AppColor.strokeWhiteColor,
                filled: true,
                fillColor:themeProvider.isDarkMode()
                    ?AppColor.inputsBlueDarkMode:AppColor.whiteColor ,
                suffixIcon: Icon(Icons.search,color:themeProvider.isDarkMode()
                    ?AppColor.mainBlueColor:AppColor.blueColor ,size:35.sp,),
      
              ),
      SizedBox(height: 10.h,),
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
      ),
    );
  }
}
