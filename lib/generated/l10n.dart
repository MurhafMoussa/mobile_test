// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Things ToDo`
  String get appTitle {
    return Intl.message(
      'Things ToDo',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Things`
  String get things {
    return Intl.message(
      'Things',
      name: 'things',
      desc: '',
      args: [],
    );
  }

  /// `Tod`
  String get tod {
    return Intl.message(
      'Tod',
      name: 'tod',
      desc: '',
      args: [],
    );
  }

  /// `Password Must Be 8 Characters At Least`
  String get passwordMustBe8CharactersAtLeast {
    return Intl.message(
      'Password Must Be 8 Characters At Least',
      name: 'passwordMustBe8CharactersAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Old Password`
  String get pleaseEnterOldPassword {
    return Intl.message(
      'Please Enter Old Password',
      name: 'pleaseEnterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please Enter Password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please Enter Email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Is Not Valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email Is Not Valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get failure {
    return Intl.message(
      'Failure',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Name Must Be 3 Characters At Least`
  String get nameMustBe3CharactersAtLeast {
    return Intl.message(
      'Name Must Be 3 Characters At Least',
      name: 'nameMustBe3CharactersAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Confirm Password`
  String get pleaseConfirmPassword {
    return Intl.message(
      'Please Confirm Password',
      name: 'pleaseConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password And Confirm Password Fields Don't Match`
  String get passwordAndConfirmPasswordFieldsDontMatch {
    return Intl.message(
      'Password And Confirm Password Fields Don\'t Match',
      name: 'passwordAndConfirmPasswordFieldsDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Phone Number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please Enter Phone Number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Number`
  String get pleaseEnterValidNumber {
    return Intl.message(
      'Please Enter Valid Number',
      name: 'pleaseEnterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the app`
  String get welcomeToTheApp {
    return Intl.message(
      'Welcome to the app',
      name: 'welcomeToTheApp',
      desc: '',
      args: [],
    );
  }

  /// `HomePage`
  String get homepage {
    return Intl.message(
      'HomePage',
      name: 'homepage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
