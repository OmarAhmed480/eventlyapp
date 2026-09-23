import 'package:eventlyapp/UI/TabList/HomeTab/widget/event_item.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/eventsTabBar.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/homeHeaderActions.dart';
import 'package:eventlyapp/UI/TabList/HomeTab/widget/welcomeUserWidget.dart';
import 'package:eventlyapp/firebaseUtils.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/model/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_language_providers.dart';
import '../../../providers/app_theme_providers.dart';

import '../../../utils/app_Toast.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_styel.dart';
import '../../../generailWidget/mainErrorWidget .dart';
import '../../../generailWidget/mainLoadingWidget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  late Stream<List<Event>>? eventStream;

  @override
  void initState() {
    super.initState();

    eventStream = FirebaseUtils.getAllEvent(uId: FirebaseAuth.instance.currentUser!.uid);
  }

  void updateStream(int index, String uId) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      eventStream = FirebaseUtils.getAllEvent(uId: uId);
    } else {
      eventStream = FirebaseUtils.getFilterEvent(
        selectedIndex: selectedIndex,
        uId: uId,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProviders>(context);

    var eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8.w),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeProvider.isDarkMode()
              ? AppColor.bGDarkMode
              : AppColor.bGLightMode,
          body: Column(
            children: [
              Row(
                children: [
                  WelcomeUserWidget(
                    userName:FirebaseAuth.instance.currentUser?.displayName??"",
                  ),
                  const Spacer(),
                  HomeHeaderActions(
                    themeProvider: themeProvider,
                    languageProvider: languageProvider,
                  ),
                ],
              ),
              EventsTabBar(
                eventsNameList: eventsNameList,
                selectedIndex: selectedIndex,
                isDarkMode: themeProvider.isDarkMode(),
                onTap: (index) {
                  updateStream(index, FirebaseAuth.instance.currentUser!.uid);
                },
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: StreamBuilder<List<Event>>(
                  stream: eventStream,
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
                        )!.noEventFound,
                        style: themeProvider.isDarkMode()
                            ? AppStyle.semibold14whiteColor
                            : AppStyle.semibold14whiteColor.copyWith(
                                color: AppColor.blackColor,
                              ),
                      );
                    }
                     Event.eventList = snapshot.data!;
                    return ListView.builder(
                      itemCount: Event.eventList.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          event: Event.eventList[index],
                          onFavoritePressed: () {
                            FirebaseUtils.updateIsFavorite(Event.eventList[index], FirebaseAuth.instance.currentUser!.uid)
                                .then((value) {
                                  AppToast.toastMsg(
                                    msg: AppLocalizations.of(
                                      context,
                                    )!.eventUpdateSuccessfully,
                                    backgroundColor: Colors.green,
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
                          ).format(Event.eventList[index].eventDate),
                          eventTitle:Event. eventList[index].eventTitle,
                          eventImage: Event.eventList[index].eventImage,

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
