import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_styel.dart';

class WelcomeUserWidget extends StatelessWidget {
  final String userName;

  const WelcomeUserWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Theme.of(context);

    return Column(
      children: [
        Text(
          "${AppLocalizations.of(context)!.welcomeBack}✨",
          style: themeProvider.brightness == Brightness.dark
              ? AppStyle.regular14secTextDarkMode
              : AppStyle.regular14secTextLightMode,
        ),
        Text(
          userName,
          style: themeProvider.brightness == Brightness.dark
              ? AppStyle.medium20whiteColorTextDarkMode
              : AppStyle.medium20blackColorTextLightMode,
        ),
      ],
    );
  }
}
