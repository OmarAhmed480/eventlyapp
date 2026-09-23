import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../firebaseUtils.dart';
import '../../../generailWidget/custom_text_field.dart';
import '../../../model/event.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_Toast.dart';
import '../../../generailWidget/mainErrorWidget .dart';
import '../../../generailWidget/mainLoadingWidget.dart';
import '../HomeTab/widget/event_item.dart';

class HeartTab extends StatefulWidget {
  HeartTab({super.key});

  @override
  State<HeartTab> createState() => _HeartTabState();
}

class _HeartTabState extends State<HeartTab> {
  List<Event> favoriteEventList = [];
  late Stream<List<Event>>? favoriteStream;

  @override
  void initState() {
    super.initState();

    favoriteStream = FirebaseUtils.getAllFavoriteEvent(uId: FirebaseAuth.instance.currentUser!.uid );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColor.bGDarkMode
            : AppColor.bGLightMode,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              CustomTextField(

                textStyle:themeProvider.isDarkMode()
                    ? AppStyle.regular14secTextDarkMode
                    : AppStyle.regular14secTextLightMode.copyWith(color: AppColor.blackColor),
                keyboardType: TextInputType.name,
                hintText: AppLocalizations.of(context)!.searchForEvent,
                hintStyle: themeProvider.isDarkMode()
                    ? AppStyle.regular14secTextDarkMode
                    : AppStyle.regular14secTextLightMode,
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColor.strokeBlueColor
                    : AppColor.strokeWhiteColor,
                filled: true,
                fillColor: themeProvider.isDarkMode()
                    ? AppColor.inputsBlueDarkMode
                    : AppColor.whiteColor,
                suffixIcon: Icon(
                  Icons.search,
                  color: themeProvider.isDarkMode()
                      ? AppColor.mainBlueColor
                      : AppColor.blueColor,
                  size: 35.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: StreamBuilder<List<Event>>(
                  stream: favoriteStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return MainLoadingWidget(
                        backgroundColor: AppColor.blueColor,
                      );
                    }
                    if (snapshot.hasError) {
                      return MainErrorWidget(
                        errorMessage: snapshot.error.toString(),
                        style: themeProvider.isDarkMode()
                            ? AppStyle.semibold14whiteColor
                            : AppStyle.semibold14whiteColor.copyWith(
                                color: AppColor.blackColor,
                              ),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return MainErrorWidget(
                        errorMessage: AppLocalizations.of(
                          context,
                        )!.noFavoriteEventFound,
                        style: themeProvider.isDarkMode()
                            ? AppStyle.semibold14whiteColor
                            : AppStyle.semibold14whiteColor.copyWith(
                                color: AppColor.blackColor,
                              ),
                      );
                    }
                    var favoriteEventList = snapshot.data!;
                    return ListView.builder(
                      itemCount: favoriteEventList.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          event: favoriteEventList[index],
                          onFavoritePressed: () {
                            FirebaseUtils.updateIsFavorite(
                                  favoriteEventList[index],
                                FirebaseAuth.instance.currentUser!.uid

                                )
                                .then((value) {
                                  AppToast.toastMsg(
                                    msg: AppLocalizations.of(context)!.eventRemoveSuccessfully,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: AppColor.whiteColor,
                                  );
                                })
                                .onError((error, stackTrace) {
                                  AppToast.toastMsg(
                                    msg: error.toString(),
                                    backgroundColor: Colors.red,
                                    textColor: AppColor.whiteColor,
                                  );
                                });
                          },
                          eventDate: DateFormat(
                            "dd MMM",
                          ).format(favoriteEventList[index].eventDate),
                          eventTitle: favoriteEventList[index].eventTitle,
                          eventImage: favoriteEventList[index].eventImage,

                        );
                      },
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
