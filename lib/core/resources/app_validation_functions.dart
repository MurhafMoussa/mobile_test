import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/generated/l10n.dart';

class AppValidation {
  static String? validatePasswordConfirmation(
    String? passwordConfirmation,
    String? password,
    BuildContext context,
  ) {
    if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
      return AppLocalizations.of(context).pleaseConfirmPassword;
    } else if (passwordConfirmation != password) {
      return AppLocalizations.of(context)
          .passwordAndConfirmPasswordFieldsDontMatch;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterPhoneNumber;
    } else if (!value.isNumericOnly) {
      return AppLocalizations.of(context).pleaseEnterValidNumber;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterPassword;
    } else if (value.length < 8) {
      return AppLocalizations.of(context).passwordMustBe8CharactersAtLeast;
    } else {
      return null;
    }
  }

  static String? validateOldPassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Old Password';
    } else if (value.length < 8) {
      return AppLocalizations.of(context).passwordMustBe8CharactersAtLeast;
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterNewPassword;
    } else if (value.length < 8) {
      return AppLocalizations.of(context).passwordMustBe8CharactersAtLeast;
    } else {
      return null;
    }
  }

  static String? validateNewPasswordConfirmation(
    String? passwordConfirmation,
    String? password,
    BuildContext context,
  ) {
    if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
      return AppLocalizations.of(context).pleaseConfirmNewPassword;
    } else if (passwordConfirmation != password) {
      return AppLocalizations.of(context)
          .passwordAndConfirmPasswordFieldsDontMatch;
    } else {
      return null;
    }
  }

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterYourName;
    } else if (value.length < 3) {
      return AppLocalizations.of(context).nameMustBe3CharactersAtLeast;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterEmail;
    } else if (!value.isEmail) {
      return AppLocalizations.of(context).emailIsNotValid;
    } else {
      return null;
    }
  }
}
