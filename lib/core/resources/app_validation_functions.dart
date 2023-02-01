import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/generated/l10n.dart';

class AppValidation {
  // static String? validateOldPassword(String? value,BuildContext context) {
  //   if (value == null || value.isEmpty) {
  //     return AppLocalizations.of(context).pleaseEnterOldPassword;
  //   } else if (value.length < 8) {
  //     return AppLocalizations.of(context).passwordMustBe8CharactersAtLeast;
  //   } else {
  //     return null;
  //   }
  // }

  // static String? validateConfirmPassword(
  //     String? passwordConfirmation, String? newPassword) {
  //   if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
  //     return AppStrings.plzConfirmPassword.tr();
  //   } else if (passwordConfirmation != newPassword) {
  //     return AppStrings.confirmDontMatch.tr();
  //   } else {
  //     return null;
  //   }
  // }

  // static String? validateNewPassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return AppStrings.plzEnterNewPassword.tr();
  //   } else if (value.length < 8) {
  //     return AppStrings.passMustBeGreaterThan7.tr();
  //   } else {
  //     return null;
  //   }
  // }

  // static String? validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return AppStrings.plsEnterPhoneNum.tr();
  //   } else if (value.length < 12) {
  //     return AppStrings.phoneNumMustBeGreaterThan8.tr();
  //   } else {
  //     return null;
  //   }
  // }

  static String? validatePassword(String? value,BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterPassword;
    } else if (value.length < 8) {
      return AppLocalizations.of(context).passwordMustBe8CharactersAtLeast;
    } else {
      return null;
    }
  }

  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return AppStrings.plzEnterName.tr();
  //   } else if (value.length < 5) {
  //     return AppStrings.userNameLengthValidation.tr();
  //   } else {
  //     return null;
  //   }
  // } 
  static String? validateEmail(String? value,BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterEmail;
    } else if (!value.isEmail) {
      return AppLocalizations.of(context).emailIsNotValid;
    } else {
      return null;
    }
  }
}
