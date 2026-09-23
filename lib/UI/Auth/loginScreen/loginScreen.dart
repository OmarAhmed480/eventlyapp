import 'package:eventlyapp/UI/Auth/loginScreen/widget/authButton.dart';
import 'package:eventlyapp/UI/Auth/loginScreen/widget/loginFormFields.dart';
import 'package:eventlyapp/firebaseUtils.dart';
import 'package:eventlyapp/l10n/app_localizations.dart';
import 'package:eventlyapp/model/my_User.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_styel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../generailWidget/function/dialogUtils.dart';
import '../../../providers/app_theme_providers.dart';
import '../../../utils/app_routes.dart';
import '../registerScreen/widget/clreadyHaveAccountWidget.dart';
import '../registerScreen/widget/googleAuthButton.dart';
import '../registerScreen/widget/orDividerWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController(

  );
  final TextEditingController controllerPassword = TextEditingController(

  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProviders>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColor.bGDarkMode
          : AppColor.bGLightMode,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 64.h),
                Center(
                  child: Image.asset(
                    themeProvider.isDarkMode()
                        ? AppAssets.eventty
                        : AppAssets.eventty2,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  AppLocalizations.of(context)!.loginToYourAccount,
                  style: themeProvider.isDarkMode()
                      ? AppStyle.semibold24whiteColor
                      : AppStyle.semibold24mainBlueColor.copyWith(
                          color: AppColor.blueColor,
                        ),
                ),
                LoginFormFields(
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                  isDarkMode: themeProvider.isDarkMode(),
                  isObscure: isObscure,

                  onPasswordVisibilityChanged: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },

                  onForgetPasswordPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.forgetRouteName);
                  },
                ),
                AuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    signIn();
                  },
                ),
                SizedBox(height: 48.h),
                AuthFooterWidget(
                  isDarkMode: themeProvider.isDarkMode(),
                  message: AppLocalizations.of(context)!.dontHaveAnAccount,
                  actionText: AppLocalizations.of(context)!.signup,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.registerRouteName);
                  },
                ),
                SizedBox(height: 32.h),
                OrDividerWidget(isDarkMode: themeProvider.isDarkMode()),
                SizedBox(height: 32.h),

                GoogleAuthButton(
                  isDarkMode: themeProvider.isDarkMode(),
                  onPressed: () {
                    signInWithGoogle();
                  },
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    // TODO: Validate
    if (_formKey.currentState!.validate()) {
      // TODO: Hide Keyboard
      FocusScope.of(context).unfocus();

      try {
        // TODO: Show Loading
        DialogUtils.showLoadingDialog(context: context);

        // TODO: Sign In
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: controllerEmail.text,
              password: controllerPassword.text,
            );

        // TODO: Read User From Firestore
        var userToFireStore = await FirebaseUtils.readUserToFireStore(
          credential.user?.uid ?? "",
        );

        if (userToFireStore == null) {
          Navigator.pop(context);
          return;
        }

        // TODO: Close Loading
        Navigator.pop(context);

        // TODO: Show Success Message
        await DialogUtils.showMessageDialog(
          showOkButton: true,
          context: context,
          text: AppLocalizations.of(context)!.loginSuccessfully,
        );

        // TODO: Go Home
        Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
      } on FirebaseAuthException catch (e) {
        // TODO: Close Loading
        Navigator.pop(context);

        // TODO: Email Error
        if (e.code == 'invalid-email') {
          await DialogUtils.showMessageDialog(
            showOkButton: true,

            context: context,
            text: AppLocalizations.of(context)!.emailAddressIsNotValid,
          );

          // TODO: Network Error
        } else if (e.code == 'network-request-failed') {
          await DialogUtils.showMessageDialog(
            showOkButton: true,
            context: context,

            text: AppLocalizations.of(context)!.networkRequestError,
          );

          // TODO: Firebase Error
        } else {
          await DialogUtils.showMessageDialog(
            showOkButton: true,

            context: context,
            text: e.message ?? "Login failed",
          );
        }
      } catch (e) {
        // TODO: Other Error
        Navigator.pop(context);

        await DialogUtils.showMessageDialog(
          showOkButton: true,

          context: context,
          text: e.toString(),
        );
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // TODO: Get Google Sign-In instance
      final GoogleSignIn signIn = GoogleSignIn.instance;

      // TODO: Initialize Google Sign-In
      await signIn.initialize(
        serverClientId:
            "386286644015-dpe4q2o4ei5ori5lhkffsa80j3gumi7i.apps.googleusercontent.com",
      );

      // TODO: Start Google Sign-In authentication
      final GoogleSignInAccount? googleUser = await signIn.authenticate();

      // TODO: Check if the user canceled Google Sign-In
      if (googleUser == null) {
        return;
      }

      // TODO: Get Google authentication details
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // TODO: Create Firebase credential using Google ID token
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // TODO: Sign in to Firebase using Google credential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      // TODO: Get Firebase user
      final firebaseUser = userCredential.user;

      // TODO: Check if Firebase user exists
      if (firebaseUser != null) {
        // TODO: Create MyUser object from Firebase user data
        final MyUser myUser = MyUser(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? "",
          email: firebaseUser.email ?? "",
        );

        // TODO: Save user data to Firestore
        await FirebaseUtils.addUserToFireStore(myUser);

        // TODO: Show successful Google Sign-In message
        DialogUtils.showMessageDialog(
          showOkButton: true,
          onPressedOk: () {
            // TODO: Navigate to Home screen
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
          },
          context: context,
          text: AppLocalizations.of(context)!.googleSignInSuccessfully,
        );
      }
    } catch (e) {
      // TODO: Show error message if Google Sign-In fails
      DialogUtils.showMessageDialog(
        showOkButton: true,

        context: context,
        text: AppLocalizations.of(context)!.pleaseTryAgain,
      );
    }
  }
}
