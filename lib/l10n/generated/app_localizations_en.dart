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
  String get addDepthImage => 'Add  as depth map';

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
  String get arrow => 'Arrow';

  @override
  String get assets => 'Assets';

  @override
  String get back => 'Back';

  @override
  String get browse => 'Browse';

  @override
  String get cancel => 'Cancel';

  @override
  String get circle => 'Circle';

  @override
  String get close => 'Close';

  @override
  String get closeEditorWarningCancelBtn => 'Cancel';

  @override
  String get closeEditorWarningMessage => 'Are you sure you want to close the Image Editor? Your changes will \n not be saved.';

  @override
  String get closeEditorWarningTitle => 'Close Image Editor?';

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
  String get documentation => 'Documentation';

  @override
  String get done => 'Done';

  @override
  String get doneLoadingMsg => 'Changes are being applied';

  @override
  String get dragImageHere => 'Drag image here, or';

  @override
  String get edit => 'Edit';

  @override
  String get eraser => 'Eraser';

  @override
  String get export => 'Export';

  @override
  String get filterBottomNavigationBarText => 'Filter';

  @override
  String get freestyle => 'Free Style';

  @override
  String get generate => 'Generate';

  @override
  String get home => 'Home';

  @override
  String get height => 'Height';

  @override
  String get help => 'Help';

  @override
  String get import => 'Import';

  @override
  String get ipv4 => 'IPv4 Address';

  @override
  String get ipv6 => 'IPv6 Address';

  @override
  String get k2DWorkspace => '2D Workspace';

  @override
  String get k3DWorkspace => '3D Workspace';

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
  String get line => 'Line';

  @override
  String get loadingDialogMsg => 'Please wait...';

  @override
  String get location => 'Location';

  @override
  String get mobileData => 'Mobile Data';

  @override
  String get models => 'Models';

  @override
  String get modelsDesc => 'Models management';

  @override
  String get myProjects => 'My projects';

  @override
  String get name => 'Name';

  @override
  String get navPaneStyle => 'Navigation Pane Style';

  @override
  String get neww => 'New';

  @override
  String get newProject => 'New Project';

  @override
  String get no => 'No';

  @override
  String get noConnection => 'No connection';

  @override
  String get noProjects => 'No projects found';

  @override
  String get open => 'Open';

  @override
  String get openProject => 'Open Project';

  @override
  String get pebottomNavigationBarText => 'Paint';

  @override
  String get pingTheServer => 'Ping the server';

  @override
  String get primaryFont => 'Primary Font';

  @override
  String get process => 'Process';

  @override
  String get project => 'Project';

  @override
  String get projectMustNotBeEmpty => 'You must give a name for your project';

  @override
  String get projectMustNotHaveSpecialChar => 'The project name shouldn\'t have special characters like .@!#\$%^,....';

  @override
  String get projectName => 'Project name';

  @override
  String get projectType => 'Project type';

  @override
  String get rectangle => 'Rectangle';

  @override
  String get redo => 'Redo';

  @override
  String get rename => 'Rename';

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
  String get selfNetwork => 'Personal Network';

  @override
  String get selfNetworkDesc => 'The network of the user';

  @override
  String get server => 'Server';

  @override
  String get serverandnet => 'Server & Network Configuration';

  @override
  String get serverDesc => 'Connection config';

  @override
  String get settings => 'Settings';

  @override
  String serverPingStatus(String status) {
    return '$status';
  }

  @override
  String get statisticsView => 'Statistics View';

  @override
  String get tapTheCircleToPing => 'Tap the circle to ping';

  @override
  String get toolProperties => 'Tool Properties';

  @override
  String get themeCustomization => 'Theme Customization';

  @override
  String get themeSelection => 'Primary Theme Selection';

  @override
  String get tuneBottomNavigationBarText => 'Tune';

  @override
  String get typographyAndReadability => 'Typography & Readability';

  @override
  String get undo => 'Undo';

  @override
  String get view => 'View';

  @override
  String get width => 'Width';

  @override
  String get yes => 'Yes';
}
