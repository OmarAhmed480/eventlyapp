import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @darkmode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkmode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorite;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'✨ Welcome back'**
  String get welcomeBack;

  /// No description provided for @searchForEvent.
  ///
  /// In en, this message translates to:
  /// **'Search for an event'**
  String get searchForEvent;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get letsStart;

  /// No description provided for @thisIsABirthdayParty.
  ///
  /// In en, this message translates to:
  /// **'This is a birthday party'**
  String get thisIsABirthdayParty;

  /// No description provided for @meetingForUpdatingTheDevelopmentMethod.
  ///
  /// In en, this message translates to:
  /// **'Meeting to update the development method'**
  String get meetingForUpdatingTheDevelopmentMethod;

  /// No description provided for @discoverUniqueExhibitionsAndTalents.
  ///
  /// In en, this message translates to:
  /// **'Discover unique exhibitions and talents'**
  String get discoverUniqueExhibitionsAndTalents;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @meeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meeting;

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// No description provided for @workshop.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get workshop;

  /// No description provided for @bookClub.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get bookClub;

  /// No description provided for @exhibition.
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get exhibition;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @eating.
  ///
  /// In en, this message translates to:
  /// **'Eating'**
  String get eating;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @loginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get loginToYourAccount;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgetPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccount;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @confirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmYourPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get signUp;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signUpWithGoogle;

  /// No description provided for @addEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get addEvent;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @eventTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventTitle;

  /// No description provided for @eventDescription.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get eventDescription;

  /// No description provided for @eventDate.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventDate;

  /// No description provided for @eventTime.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get eventTime;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get chooseDate;

  /// No description provided for @chooseTime.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get chooseTime;

  /// No description provided for @thereAreNoEventsCurrently.
  ///
  /// In en, this message translates to:
  /// **'There are no events currently'**
  String get thereAreNoEventsCurrently;

  /// No description provided for @mailSent.
  ///
  /// In en, this message translates to:
  /// **'Mail sent successfully, please check your email'**
  String get mailSent;

  /// No description provided for @noUserFound.
  ///
  /// In en, this message translates to:
  /// **'No user found for that email.'**
  String get noUserFound;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password provided for that user.'**
  String get wrongPassword;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @eventDetails.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventDetails;

  /// No description provided for @areYouSureYouWantToDeleteThisEvent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this event?'**
  String get areYouSureYouWantToDeleteThisEvent;

  /// No description provided for @editEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get editEvent;

  /// No description provided for @updateEvent.
  ///
  /// In en, this message translates to:
  /// **'Update Event'**
  String get updateEvent;

  /// No description provided for @eventDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event deleted successfully'**
  String get eventDeletedSuccessfully;

  /// No description provided for @pleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In Is Not Valid. Please Try Again.'**
  String get pleaseTryAgain;

  /// No description provided for @loginSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Login Successfully'**
  String get loginSuccessfully;

  /// No description provided for @emailAddressIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Email address is not valid'**
  String get emailAddressIsNotValid;

  /// No description provided for @networkRequestError.
  ///
  /// In en, this message translates to:
  /// **'Thrown if there was a network request error'**
  String get networkRequestError;

  /// No description provided for @googleSignInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In Successfully'**
  String get googleSignInSuccessfully;

  /// No description provided for @network_error.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get network_error;

  /// No description provided for @too_many_requests.
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get too_many_requests;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalid_email;

  /// No description provided for @operation_not_allowed.
  ///
  /// In en, this message translates to:
  /// **'Email/password sign-in is not enabled'**
  String get operation_not_allowed;

  /// No description provided for @personalizeYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalizeYourExperience;

  /// No description provided for @personalizeYourExperienceContent.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get personalizeYourExperienceContent;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @noFavoriteEventFound.
  ///
  /// In en, this message translates to:
  /// **'No Favorite Event Found'**
  String get noFavoriteEventFound;

  /// No description provided for @eventRemoveSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event Remove Success Fully'**
  String get eventRemoveSuccessfully;

  /// No description provided for @eventUpdateSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event Update Success Fully'**
  String get eventUpdateSuccessfully;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @passwordTooWeak.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get passwordTooWeak;

  /// No description provided for @accountAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get accountAlreadyExists;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @effortlessEventPlanning.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get effortlessEventPlanning;

  /// No description provided for @effortlessEventPlanningContent.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get effortlessEventPlanningContent;

  /// No description provided for @noEventFound.
  ///
  /// In en, this message translates to:
  /// **'No Event Found'**
  String get noEventFound;

  /// No description provided for @connectWithFriendsShareMoments.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get connectWithFriendsShareMoments;

  /// No description provided for @connectWithFriendsShareMomentsContent.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get connectWithFriendsShareMomentsContent;

  /// No description provided for @findEventsThatInspireYou.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get findEventsThatInspireYou;

  /// No description provided for @findEventsThatInspireYouContent.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get findEventsThatInspireYouContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
