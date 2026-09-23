import 'package:eventlyapp/UI/AddEvent/widget/eventAppBar.dart';
import 'package:eventlyapp/UI/AddEvent/widget/eventCategoryList.dart';
import 'package:eventlyapp/UI/AddEvent/widget/eventDateTimeRow.dart';
import 'package:eventlyapp/firebaseUtils.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/model/event.dart';
import 'package:eventlyapp/utils/app_Toast.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_theme_providers.dart';
import '../../generailWidget/app_validator.dart';
import '../../generailWidget/custom_text_field.dart';
import '../../generailWidget/generalbutton.dart';
import '../../providers/app_language_providers.dart';


class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  List<String> eventsNameList = [];
  List<String> eventsImagesLightList = [];
  List<String> eventsImagesDarkList = [];
  DateTime? selectedDate;
  String formattedDate = "";
  String title = "";
  String description = "";
  int selectedIndex = 0;
  TimeOfDay? selectedTime;
  String formattedTime = "";
  final _formKey = GlobalKey<FormState>();
  String eventsName = "";
  String eventsImages = "";

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    var languageProvider = Provider.of<AppLanguageProviders>(context);

    eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
    eventsImagesLightList = [
      AppAssets.sportLite,
      AppAssets.birthdayLite,
      AppAssets.meetingLite,
      AppAssets.bookClubLite,
      AppAssets.exhibitionLite,
    ];
    eventsImagesDarkList = [
      AppAssets.sportDark,
      AppAssets.birthdayDark,
      AppAssets.meetingDark,
      AppAssets.bookClubDark,
      AppAssets.exhibitionDark,
    ];
    eventsName = eventsNameList[selectedIndex];
    eventsImages = themeProvider.isDarkMode()
        ? eventsImagesDarkList[selectedIndex]
        : eventsImagesLightList[selectedIndex];
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      appBar: EventAppBar(
        themeProvider: themeProvider,
        languageProvider: languageProvider,
        title: AppLocalizations.of(context)!.addEvent,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    border: Border.all(
                      width: 1.w,
                      color: Theme.of(context).disabledColor,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eventsImages),
                    ),
                  ),
                ),
                EventCategoryList(
                  eventsNameList: eventsNameList,
                  selectedIndex: selectedIndex,
                  isDarkMode: themeProvider.isDarkMode(),
                  onSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: themeProvider.isDarkMode()
                      ? AppStyle.medium16whiteColorTextDarkMode
                      : AppStyle.medium16mainBlackColorTextLightMode,
                ),
                CustomTextField(
                  validator: AppValidators.validateEventTitle,
                  onChanged: (newValue) {
                    title = newValue;
                  },
                  borderSideColor: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.strokeWhiteColor,
                  filled: true,
                  fillColor: themeProvider.isDarkMode()
                      ? AppColor.inputsBlueDarkMode
                      : AppColor.strokeWhiteColor,
                  hintText: AppLocalizations.of(context)!.eventTitle,
                  hintStyle: themeProvider.isDarkMode()
                      ? AppStyle.regular14secTextDarkMode
                      : AppStyle.regular14secTextLightMode,
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: themeProvider.isDarkMode()
                      ? AppStyle.medium16whiteColorTextDarkMode
                      : AppStyle.medium16mainBlackColorTextLightMode,
                ),
                CustomTextField(
                  validator: AppValidators.validateEventDescription,
                  onChanged: (newValue) {
                    description = newValue;
                  },
                  maxLines: 4,
                  borderSideColor: themeProvider.isDarkMode()
                      ? AppColor.strokeBlueColor
                      : AppColor.strokeWhiteColor,
                  filled: true,
                  fillColor: themeProvider.isDarkMode()
                      ? AppColor.inputsBlueDarkMode
                      : AppColor.strokeWhiteColor,
                  hintText: AppLocalizations.of(context)!.eventDescription,
                  hintStyle: themeProvider.isDarkMode()
                      ? AppStyle.regular14secTextDarkMode
                      : AppStyle.regular14secTextLightMode,
                ),
                EventDateTimeRow(
                  styleChooseDatetime: AppStyle.regular14mainBlueColor,
                  styleDatetime: themeProvider.isDarkMode()
                      ? AppStyle.medium16whiteColorTextDarkMode
                      : AppStyle.medium16mainBlackColorTextLightMode,
                  assetsDatetime: AppAssets.calendarAdd,
                  colorDatetime: themeProvider.isDarkMode()
                      ? AppColor.mainBlueColor
                      : AppColor.blueColor,
                  onTap: () {
                    chooseDate();
                  },
                  chooseDatetime: selectedDate == null
                      ? AppLocalizations.of(context)!.chooseDate
                      : formattedDate,
                  eventDatetime: AppLocalizations.of(context)!.eventDate,
                ),
                EventDateTimeRow(
                  styleChooseDatetime: AppStyle.regular14mainBlueColor,
                  styleDatetime: themeProvider.isDarkMode()
                      ? AppStyle.medium16whiteColorTextDarkMode
                      : AppStyle.medium16mainBlackColorTextLightMode,
                  assetsDatetime: AppAssets.clock,
                  colorDatetime: themeProvider.isDarkMode()
                      ? AppColor.mainBlueColor
                      : AppColor.blueColor,
                  onTap: () {
                    chooseTime();
                  },
                  chooseDatetime: selectedTime == null
                      ? AppLocalizations.of(context)!.chooseTime
                      : formattedTime,
                  eventDatetime: AppLocalizations.of(context)!.eventTime,
                ),
                GeneralButton(
                  backgroundColor: themeProvider.isDarkMode()
                      ? AppColor.mainBlueColor
                      : AppColor.strokeBlueColor,
                  onPressed: () {
                    addEvent();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.addEvent,
                    style: AppStyle.medium20whiteColorTextDarkMode,
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (chooseTime != null) {
      selectedTime = chooseTime;

      formattedTime = chooseTime.format(context);
    }

    setState(() {});
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (chooseDate != null) {
      selectedDate = chooseDate;

      formattedDate = DateFormat("MMMM, d, y").format(chooseDate);

      setState(() {});
    }
  }

  void addEvent() {
    if (_formKey.currentState?.validate() == true) {
      Event event = Event(
        eventDate: DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTime!.hour,
          selectedTime!.minute,
        ),
        eventCategoryIndex: selectedIndex ,
        eventImage: eventsImages,
        eventName: eventsName,
        eventDescription: description,
        eventTitle: title,
      );

      FirebaseUtils.addEventToFireStore(event,FirebaseAuth.instance.currentUser!.uid)
          .then((value) {
            AppToast.toastMsg(
              msg: "Event Added Successfully",
              backgroundColor: AppColor.blueColor,
              textColor: AppColor.whiteColor,
            );
            Navigator.pop(context);
          })
          .catchError((error) {
            AppToast.toastMsg(
              msg: error.toString(),
              backgroundColor: AppColor.blueColor,
              textColor: AppColor.whiteColor,
            );
          });
    }
  }
}
