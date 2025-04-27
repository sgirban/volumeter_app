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

  /// Add depth image
  ///
  /// In en, this message translates to:
  /// **'Add  as depth map'**
  String get addDepthImage;

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

  /// The word arrow
  ///
  /// In en, this message translates to:
  /// **'Arrow'**
  String get arrow;

  /// The word assets
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get assets;

  /// Used as tooltip for button that goes to previous action or undo an action
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// The word browse
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// The word cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// The word circle
  ///
  /// In en, this message translates to:
  /// **'Circle'**
  String get circle;

  /// The word close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// The word cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get closeEditorWarningCancelBtn;

  /// Explicit detailed message for close project dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close the Image Editor? Your changes will \n not be saved.'**
  String get closeEditorWarningMessage;

  /// Explicit title for close project dialog
  ///
  /// In en, this message translates to:
  /// **'Close Image Editor?'**
  String get closeEditorWarningTitle;

  /// The word create
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// The title of project cration dialog
  ///
  /// In en, this message translates to:
  /// **'Create Project'**
  String get createProject;

  /// The title of project cration dialog
  ///
  /// In en, this message translates to:
  /// **'Failed to create the project'**
  String get createProjectFail;

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

  /// The word delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// The title of delete project dialog
  ///
  /// In en, this message translates to:
  /// **'Delete project'**
  String get deleteDialog;

  /// Explicit detailed message for delete project dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this project?'**
  String get deleteDialogMessage;

  /// Used as placeholder for deselect dropdown
  ///
  /// In en, this message translates to:
  /// **'Deselect'**
  String get deselect;

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

  /// The word download
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// The word documentation
  ///
  /// In en, this message translates to:
  /// **'Documentation'**
  String get documentation;

  /// The word done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// The message displayed in the loading dialog
  ///
  /// In en, this message translates to:
  /// **'Changes are being applied'**
  String get doneLoadingMsg;

  /// The message displayed when the user can drag an image to the app
  ///
  /// In en, this message translates to:
  /// **'Drag image here, or'**
  String get dragImageHere;

  /// The word edit
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// The word eraser
  ///
  /// In en, this message translates to:
  /// **'Eraser'**
  String get eraser;

  /// The word export
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// The word filter
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterBottomNavigationBarText;

  /// The word free style
  ///
  /// In en, this message translates to:
  /// **'Free Style'**
  String get freestyle;

  /// The word generate
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generate;

  /// The title used for home page. The main page where user lands when opens the app
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// The word height
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// The word help
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// The word import
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// The addres in the IP v4 format
  ///
  /// In en, this message translates to:
  /// **'IPv4 Address'**
  String get ipv4;

  /// The addres in the IP v6 format
  ///
  /// In en, this message translates to:
  /// **'IPv6 Address'**
  String get ipv6;

  /// The title of 2D workspace page
  ///
  /// In en, this message translates to:
  /// **'2D Workspace'**
  String get k2DWorkspace;

  /// The title of 3D workspace page
  ///
  /// In en, this message translates to:
  /// **'3D Workspace'**
  String get k3DWorkspace;

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

  /// The title of the last update section in the settings page
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Last update: {count} days ago} zero{Last update: today} one{Last update: 1 day ago}}'**
  String lastUpdateStatus(int count);

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

  /// The word line
  ///
  /// In en, this message translates to:
  /// **'Line'**
  String get line;

  /// The message displayed in the loading dialog
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get loadingDialogMsg;

  /// The location. It is deduced from the IP address
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Cellular data. It is used as word for settings category when cellular data is turned on
  ///
  /// In en, this message translates to:
  /// **'Mobile Data'**
  String get mobileData;

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

  /// The title of the projcts page
  ///
  /// In en, this message translates to:
  /// **'My projects'**
  String get myProjects;

  /// The word name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Used as setting item for choosing the NavigationPaneStyle
  ///
  /// In en, this message translates to:
  /// **'Navigation Pane Style'**
  String get navPaneStyle;

  /// The word new
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get neww;

  /// The buton title that aims to create a new project
  ///
  /// In en, this message translates to:
  /// **'New Project'**
  String get newProject;

  /// The word no
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// The message displayed when there is no connection
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get noConnection;

  /// The message displayed when there are no projects
  ///
  /// In en, this message translates to:
  /// **'No projects found'**
  String get noProjects;

  /// The word open
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// The button title that aims to open a project
  ///
  /// In en, this message translates to:
  /// **'Open Project'**
  String get openProject;

  /// The word paint
  ///
  /// In en, this message translates to:
  /// **'Paint'**
  String get pebottomNavigationBarText;

  /// Used to ping the server in the settings page
  ///
  /// In en, this message translates to:
  /// **'Ping the server'**
  String get pingTheServer;

  ///
  ///
  /// In en, this message translates to:
  /// **'Primary Font'**
  String get primaryFont;

  /// The word process
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get process;

  /// The word project
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get project;

  /// The dialog error for empty project name
  ///
  /// In en, this message translates to:
  /// **'You must give a name for your project'**
  String get projectMustNotBeEmpty;

  /// The dialog error for project special characters
  ///
  /// In en, this message translates to:
  /// **'The project name shouldn\'t have special characters like .@!#\$%^,....'**
  String get projectMustNotHaveSpecialChar;

  /// The title of the project name field
  ///
  /// In en, this message translates to:
  /// **'Project name'**
  String get projectName;

  /// The title of the project type field
  ///
  /// In en, this message translates to:
  /// **'Project type'**
  String get projectType;

  /// The word rectangle
  ///
  /// In en, this message translates to:
  /// **'Rectangle'**
  String get rectangle;

  /// The word redo
  ///
  /// In en, this message translates to:
  /// **'Redo'**
  String get redo;

  /// The word rename
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// Used as placeholder for search bar
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Used as placeholder for select dropdown
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// The title of the selected items in the list
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} selected} zero{None selected} one{1 selected}}'**
  String selectedCount(int count);

  /// The word self network
  ///
  /// In en, this message translates to:
  /// **'Personal Network'**
  String get selfNetwork;

  /// The description of the self network
  ///
  /// In en, this message translates to:
  /// **'The network of the user'**
  String get selfNetworkDesc;

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

  /// The status of the server ping
  ///
  /// In en, this message translates to:
  /// **'{status}'**
  String serverPingStatus(String status);

  /// The title of the statistics page
  ///
  /// In en, this message translates to:
  /// **'Statistics View'**
  String get statisticsView;

  /// The message displayed when the user can ping the server
  ///
  /// In en, this message translates to:
  /// **'Tap the circle to ping'**
  String get tapTheCircleToPing;

  /// The title of the tool properties page
  ///
  /// In en, this message translates to:
  /// **'Tool Properties'**
  String get toolProperties;

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

  /// The word filter
  ///
  /// In en, this message translates to:
  /// **'Tune'**
  String get tuneBottomNavigationBarText;

  /// Used in the appearance section in the Typography & Readability
  ///
  /// In en, this message translates to:
  /// **'Typography & Readability'**
  String get typographyAndReadability;

  /// The word undo
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// The word view
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// The word width
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

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
