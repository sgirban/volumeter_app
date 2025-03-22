import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ro.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ro')
  ];

  /// About as text for setting item
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// About as text for setting item
  ///
  /// In en, this message translates to:
  /// **'App metadata & support'**
  String get aboutDesc;

  /// It is used in context of setting item category. Here are main majority of application configurations
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// It is used in context of setting item category. Here are main majority of application configurations
  ///
  /// In en, this message translates to:
  /// **'Power-user optimizations'**
  String get advancedDesc;

  /// Appearance and personalization. Used in settings page context
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Appearance and personalization. Used in settings page context
  ///
  /// In en, this message translates to:
  /// **'Appearance & Personalizations'**
  String get appearanceandpers;

  /// No description provided for @appearanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Interface customization'**
  String get appearanceDesc;

  /// Used as tooltip for button that goes to previous action or undo an action
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// The title of confirm close dialog
  ///
  /// In en, this message translates to:
  /// **'Confirm close'**
  String get confirmClose;

  /// Explicit detailed message for close app dialog
  ///
  /// In en, this message translates to:
  /// **'Are  you sure you want to leave the app?'**
  String get confirmCloseMessage;

  /// The word is used as for settings category item
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// Data and storage as category in the settings items
  ///
  /// In en, this message translates to:
  /// **'Data & Storage'**
  String get dataandstor;

  /// The word is used as for settings category item
  ///
  /// In en, this message translates to:
  /// **'Storage & prvacy controls'**
  String get dataDesc;

  /// Used in Appearance font and typography section
  ///
  /// In en, this message translates to:
  /// **'Distraction-Free Reading'**
  String get distractionFreeMode;

  /// No description provided for @distractionFreeModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Reduces the long paragraphs with short summary'**
  String get distractionFreeModeDesc;

  /// The title used for home page. The main page where user lands when opens the app
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Used as appearance settings section group title
  ///
  /// In en, this message translates to:
  /// **'Language & Region'**
  String get languageAndRegion;

  /// The setting item title used for changing the language
  ///
  /// In en, this message translates to:
  /// **'Interface Language'**
  String get languageInterface;

  /// The setting item description used for changing the language
  ///
  /// In en, this message translates to:
  /// **'Which language do you prefer?'**
  String get languageInterfaceDesc;

  /// The usual layout used both in interface and design
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get layout;

  /// No description provided for @layoutEnableTheme.
  ///
  /// In en, this message translates to:
  /// **'Enable quick theme switch button'**
  String get layoutEnableTheme;

  /// No description provided for @layoutEnableThemeInfo.
  ///
  /// In en, this message translates to:
  /// **'When this is enabled a button for changing the themes quickly is displayed in the window bar'**
  String get layoutEnableThemeInfo;

  /// No description provided for @layoutEnableLang.
  ///
  /// In en, this message translates to:
  /// **'Enable quick language switch button'**
  String get layoutEnableLang;

  /// No description provided for @layoutEnableLangInfo.
  ///
  /// In en, this message translates to:
  /// **'When this is enabled a button for changing the language quickly is displayed in the window bar'**
  String get layoutEnableLangInfo;

  /// Models used as word for settings category
  ///
  /// In en, this message translates to:
  /// **'Models'**
  String get models;

  /// No description provided for @modelsDesc.
  ///
  /// In en, this message translates to:
  /// **'Models management'**
  String get modelsDesc;

  /// Used as setting item for choosing the NavigationPaneStyle
  ///
  /// In en, this message translates to:
  /// **'Navigation Pane Style'**
  String get navPaneStyle;

  /// The word no
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  ///
  ///
  /// In en, this message translates to:
  /// **'Primary Font'**
  String get primaryFont;

  /// Used in the appearance section as SettingsGroup title
  ///
  /// In en, this message translates to:
  /// **'Theme Customization'**
  String get themeCustomization;

  /// Used in the appearance section in the Theme Customization group
  ///
  /// In en, this message translates to:
  /// **'Primary Theme Selection'**
  String get themeSelection;

  /// Used in the appearance section in the Typography & Readability
  ///
  /// In en, this message translates to:
  /// **'Typography & Readability'**
  String get typographyAndReadability;

  /// Used as placeholder for search bar
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Server in context of settings page
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get server;

  /// Server and network used in context of settings page
  ///
  /// In en, this message translates to:
  /// **'Server & Network Configuration'**
  String get serverandnet;

  /// No description provided for @serverDesc.
  ///
  /// In en, this message translates to:
  /// **'Connection config'**
  String get serverDesc;

  /// The settings section page where the user can be redirected
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// The word yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ro'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ro': return AppLocalizationsRo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
