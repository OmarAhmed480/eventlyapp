import 'package:eventlyapp/UI/detailsEvent/widget/eventDateTimeWidget.dart';
import 'package:eventlyapp/UI/detailsEvent/widget/eventDescriptionWidget.dart';
import 'package:eventlyapp/UI/detailsEvent/widget/eventImageWidget.dart';
import 'package:eventlyapp/firebaseUtils.dart';
import 'package:eventlyapp/model/event.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../generailWidget/function/dialogUtils.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_language_providers.dart';
import '../../providers/app_theme_providers.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styel.dart';
import '../AddEvent/widget/eventAppBar.dart';

class DetailsEvent extends StatelessWidget {
  const DetailsEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProviders>(context);
    var event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,

      appBar: EventAppBar(
        themeProvider: themeProvider,
        languageProvider: languageProvider,
        title: AppLocalizations.of(context)!.eventDetails,
        showEditButton: true,
        showDeleteButton: true,
        onEdit: () {
          Navigator.pushNamed(
            context,
            AppRoutes.editEventRouteName,
            arguments: event,
          );
        },
        onDelete: () async {
          DialogUtils.showMessageDialog(
            showNoButton: true,
            showYesButton: true,
            onPressedYes: () async {
              try {
                await FirebaseUtils.deleteEvent(
                  uId:   FirebaseAuth.instance.currentUser!.uid,
                  eventId: event.id,
                );

                DialogUtils.toastMsg(
                  msg: AppLocalizations.of(context)!.eventDeletedSuccessfully,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );

                Navigator.pop(context);
              } catch (error) {
                DialogUtils.toastMsg(
                  msg: error.toString(),
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              }
            },
            context: context,
            text: AppLocalizations.of(context)!
                .areYouSureYouWantToDeleteThisEvent,
          );
        },
      ),

      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 18.5, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EventImageWidget(
              themeProvider: themeProvider,
              eventImage: event.eventImage,
            ),

            SizedBox(height: 16.h),

            Text(
              event.eventTitle,
              style: themeProvider.isDarkMode()
                  ? AppStyle.medium18whiteColorDarkMode
                  : AppStyle.medium18blackColorTextDarkMode,
            ),

            SizedBox(height: 16.h),

            EventDateTimeWidget(
              themeProvider: themeProvider,
              date: DateFormat("dd MMMM").format(event.eventDate),
              time: DateFormat("hh:mm a").format(event.eventDate),
            ),
            SizedBox(height: 16.h),
            Text(
              "Description ",
              style: themeProvider.isDarkMode()
                  ? AppStyle.medium18whiteColorDarkMode
                  : AppStyle.medium18blackColorTextDarkMode,
            ),
            SizedBox(height: 8.h),
            EventDescriptionWidget(
              themeProvider: themeProvider,
              description: event.eventDescription,
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
