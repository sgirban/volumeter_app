import 'package:path_provider/path_provider.dart';

/// This class folows Singleton pattern and it is mainly used for keeping track of
/// the application common used paths
class ApplicationPaths {
  ApplicationPaths._constructor();
  static final ApplicationPaths _instance = ApplicationPaths._constructor();
  factory ApplicationPaths() => _instance;

  /// Paths
  String? applicationSuportDir;

  static void init() async {
    _instance.applicationSuportDir =
        (await getApplicationSupportDirectory()).path;
  }

  /// Getters
  String get projectsDir => '${_instance.applicationSuportDir}/projects';
}
