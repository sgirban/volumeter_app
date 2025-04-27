import 'package:flutter/foundation.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:volumeter/core/constants/network_constants.dart';
import 'package:volumeter/core/utils/project/application_paths.dart';
import 'package:volumeter/core/utils/settings/ui_settings.dart';
import 'package:volumeter/core/utils/settings/ui_settings_adapter.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata_adapter.dart';
import 'package:volumeter/services/hive_service.dart';
import 'package:window_manager/window_manager.dart';

/// This function is ment do do the initial setup as intitalizing the  [InheritedWidget] tree and if is desktop
/// environment then the window initialization must proceed.
///
Future<void> initializeApp() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  if (!kIsWeb) {
    ApplicationPaths.init();
  }

  // Desktop intializer
  if (isDesktop) {
    await flutter_acrylic.Window.initialize();
    if (defaultTargetPlatform == TargetPlatform.windows) {
      // We remove the defult window controlls buton to add some custom ones
      await flutter_acrylic.Window.hideWindowControls();
      await WindowManager.instance.ensureInitialized();
      windowManager.waitUntilReadyToShow().then((_) async {
        await windowManager.setTitleBarStyle(
          TitleBarStyle.hidden,
          windowButtonVisibility: false,
        );
        await windowManager.setMinimumSize(const Size(500, 600));
        await windowManager.show();
        await windowManager.setPreventClose(true);
        await windowManager.setSkipTaskbar(false);
      });
    }
  }
  kServerIP = 'mosni.go.ro';
  kServerPort = 50051;
}

/// This function is ment to register the TypeAdapters for [HiveService] and
/// initialize the Hive for flutter. Then it opens the boxes used among this app.
///
/// The main `Hive` boxes are:
/// - [UiSettings] box
Future<void> initializeHive() async {
  // Hive initialize
  // Registering the adapters
  await HiveService().registerAdapter(UiSettingsAdapter());
  await HiveService().registerAdapter(ProjectMetadataAdapter());
  // Initialize the Hive
  await HiveService().init(
    boxes: {UiSettings: 'ui_settings', ProjectMetadata: 'projects'},
  );
}
