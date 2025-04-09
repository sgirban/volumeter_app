// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get about => 'Informații';

  @override
  String get aboutDesc => 'Informații aplicație';

  @override
  String get addDepthImage => 'Adauga imagine de adâncime';

  @override
  String get advanced => 'Avansat';

  @override
  String get advancedDesc => 'Optimizări avansate';

  @override
  String get appearance => 'Aspect';

  @override
  String get appearanceandpers => 'Aspect & Personalizare';

  @override
  String get appearanceDesc => 'Personalizare interfață';

  @override
  String get assets => 'Resurse';

  @override
  String get back => 'Înapoi';

  @override
  String get browse => 'Răsfoiește';

  @override
  String get cancel => 'Anulează';

  @override
  String get create => 'Crează';

  @override
  String get createProject => 'Crează un proiect';

  @override
  String get createProjectFail => 'Eșuare creare proiect';

  @override
  String get confirmClose => 'Confirmare închidere';

  @override
  String get confirmCloseMessage => 'Sigur dorești să închizi aplicația?';

  @override
  String get data => 'Date';

  @override
  String get dataandstor => 'Date & Stocare';

  @override
  String get dataDesc => 'Stocare și confidențialitate';

  @override
  String get delete => 'Șterge';

  @override
  String get deleteDialog => 'Șterge proiectul';

  @override
  String get deleteDialogMessage => 'Sigur dorești să ștergi proiectul?';

  @override
  String get deselect => 'Deselectează';

  @override
  String get distractionFreeMode => 'Mod „citire fără distragere”';

  @override
  String get distractionFreeModeDesc => 'Înlocuiește paragrefele lungi cu o scurtă descriere a lor';

  @override
  String get download => 'Descarcă';

  @override
  String get documentation => 'Manual de utilizare';

  @override
  String get dragImageHere => 'Trage imaginea aici, sau';

  @override
  String get edit => 'Editează';

  @override
  String get export => 'Exportă';

  @override
  String get home => 'Acasă';

  @override
  String get help => 'Ajutor';

  @override
  String get import => 'Importă';

  @override
  String get k2DWorkspace => 'Spațiu 2D';

  @override
  String get k3DWorkspace => 'Spațiu 3D';

  @override
  String get languageAndRegion => 'Limbă și regiune';

  @override
  String get languageInterface => 'Limba interfeței';

  @override
  String get languageInterfaceDesc => 'Selectează limba pe care o preferi';

  @override
  String lastUpdateStatus(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Last update: acum 1 zi',
      zero: 'Ultima actualizare: astăzi',
      other: 'Ultima actualizare: acum $count zile',
    );
    return '$_temp0';
  }

  @override
  String get layout => 'Interfață';

  @override
  String get layoutEnableTheme => 'Activează modul de schimbare rapidă a temei';

  @override
  String get layoutEnableThemeInfo => 'Atunci când este activat, un buton pentru schimbarea  temei va apărea în bara ferestrei';

  @override
  String get layoutEnableLang => 'Activează modul schimbare rapidă a  limbii';

  @override
  String get layoutEnableLangInfo => 'Atunci când această opțiune este activată, un buton pentru schimbarea a limbii va aparăea în bara ferestrei';

  @override
  String get models => 'Modele';

  @override
  String get modelsDesc => 'Gestionare modele AI';

  @override
  String get myProjects => 'Proiecte';

  @override
  String get navPaneStyle => 'Stil navigator interfață';

  @override
  String get neww => 'Nou';

  @override
  String get newProject => 'Proiect nou';

  @override
  String get no => 'Nu';

  @override
  String get noProjects => 'Nu există proiecte';

  @override
  String get open => 'Deschide';

  @override
  String get openProject => 'Deschide proiect';

  @override
  String get primaryFont => 'Font principal';

  @override
  String get project => 'Proiect';

  @override
  String get projectMustNotBeEmpty => 'Trebuie să atribui un nume proiectului';

  @override
  String get projectMustNotHaveSpecialChar => 'Numele proiectului nu poate conține caractere precum .@!#\$%^,...';

  @override
  String get projectName => 'Nume proiect';

  @override
  String get projectType => 'Tip proiect';

  @override
  String get redo => 'Redo';

  @override
  String get themeCustomization => 'Configurare temă';

  @override
  String get themeSelection => 'Selectează tema principală';

  @override
  String get typographyAndReadability => 'Text & Lizibilitate';

  @override
  String get search => 'Caută';

  @override
  String get select => 'Selectează';

  @override
  String selectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selectate',
      one: '1 selectat',
    );
    return '$_temp0';
  }

  @override
  String get server => 'Server';

  @override
  String get serverandnet => 'Server & Internet';

  @override
  String get serverDesc => 'Configurații conexiuni';

  @override
  String get settings => 'Setări';

  @override
  String get statisticsView => 'Vizualizare statistică';

  @override
  String get toolProperties => 'Configurari tool';

  @override
  String get undo => 'Anulează';

  @override
  String get view => 'Vizualizare';

  @override
  String get yes => 'Da';
}
