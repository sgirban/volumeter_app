// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get about => 'About';

  @override
  String get aboutDesc => 'App metadata & support';

  @override
  String get advanced => 'Advanced';

  @override
  String get advancedDesc => 'Power-user optimizations';

  @override
  String get appearance => 'Appearance';

  @override
  String get appearanceandpers => 'Appearance & Personalizations';

  @override
  String get appearanceDesc => 'Interface customization';

  @override
  String get back => 'Back';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get createProject => 'Create Project';

  @override
  String get createProjectFail => 'Failed to create the project';

  @override
  String get confirmClose => 'Confirm close';

  @override
  String get confirmCloseMessage => 'Are  you sure you want to leave the app?';

  @override
  String get data => 'Data';

  @override
  String get dataandstor => 'Data & Storage';

  @override
  String get dataDesc => 'Storage & prvacy controls';

  @override
  String get delete => 'Delete';

  @override
  String get deleteDialog => 'Delete project';

  @override
  String get deleteDialogMessage => 'Are you sure you want to delete this project?';

  @override
  String get deselect => 'Deselect';

  @override
  String get distractionFreeMode => 'Distraction-Free Reading';

  @override
  String get distractionFreeModeDesc => 'Reduces the long paragraphs with short summary';

  @override
  String get download => 'Download';

  @override
  String get export => 'Export';

  @override
  String get home => 'Home';

  @override
  String get languageAndRegion => 'Language & Region';

  @override
  String get languageInterface => 'Interface Language';

  @override
  String get languageInterfaceDesc => 'Which language do you prefer?';

  @override
  String lastUpdateStatus(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Last update: 1 day ago',
      zero: 'Last update: today',
      other: 'Last update: $count days ago',
    );
    return '$_temp0';
  }

  @override
  String get layout => 'Layout';

  @override
  String get layoutEnableTheme => 'Enable quick theme switch button';

  @override
  String get layoutEnableThemeInfo => 'When this is enabled a button for changing the themes quickly is displayed in the window bar';

  @override
  String get layoutEnableLang => 'Enable quick language switch button';

  @override
  String get layoutEnableLangInfo => 'When this is enabled a button for changing the language quickly is displayed in the window bar';

  @override
  String get models => 'Models';

  @override
  String get modelsDesc => 'Models management';

  @override
  String get myProjects => 'My projects';

  @override
  String get navPaneStyle => 'Navigation Pane Style';

  @override
  String get newProject => 'New Project';

  @override
  String get no => 'No';

  @override
  String get noProjects => 'No projects found';

  @override
  String get open => 'Open';

  @override
  String get openProject => 'Open Project';

  @override
  String get primaryFont => 'Primary Font';

  @override
  String get projectMustNotBeEmpty => 'You must give a name for your project';

  @override
  String get projectMustNotHaveSpecialChar => 'The project name shouldn\'t have special characters like .@!#\$%^,....';

  @override
  String get projectName => 'Project name';

  @override
  String get projectType => 'Project type';

  @override
  String get themeCustomization => 'Theme Customization';

  @override
  String get themeSelection => 'Primary Theme Selection';

  @override
  String get typographyAndReadability => 'Typography & Readability';

  @override
  String get search => 'Search';

  @override
  String get select => 'Select';

  @override
  String selectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 selected',
      zero: 'None selected',
      other: '$count selected',
    );
    return '$_temp0';
  }

  @override
  String get server => 'Server';

  @override
  String get serverandnet => 'Server & Network Configuration';

  @override
  String get serverDesc => 'Connection config';

  @override
  String get settings => 'Settings';

  @override
  String get yes => 'Yes';
}
