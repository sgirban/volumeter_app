import 'dart:async' show Timer;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

/// This is a Singleton class used for abstracting and managing hive opperations
class HiveService {
  // The instance
  static final HiveService _instance = HiveService._();

  /// Defined hive boxes
  final Map<Type, String> _boxRegistration = {};

  /// Available hive boxes
  final Map<String, Box> _openBoxes = {};

  /// The dbounce timers for debounce save
  final Map<String, Timer> _debouncers = {};

  /// When [Hive].[init] function  is called this is set to `true`.
  ///
  /// A way of keeping track wheter this object was or was not initialized.
  bool _isIntialized = false;
  //
  /// Constructors
  ///
  HiveService._();
  factory HiveService() => _instance;

  /// The [init] function is used to initialize all the boxes
  Future<void> init({
    required Map<Type, String> boxes,
    String? storagePath,
  }) async {
    if (_isIntialized) {
      return;
    }
    // Hive init
    if (kIsWeb) {
      await Hive.initFlutter(storagePath);
    } else {
      final hiveDir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(storagePath ?? hiveDir.path);
    }
    // register boxes
    _boxRegistration.addAll(boxes);

    /// Open all the boxes
    await Future.wait(boxes.values.map((name) => _openBox(name)));
    _isIntialized = true;
  }

  /// This function search if the box is already open. If so it returns the [Box].
  /// If the box is not open, it opens it asyncrounously and then it returns the [Box].
  Future<Box> _openBox(String boxName) async {
    if (!_openBoxes.containsKey(boxName)) {
      final box = await Hive.openBox(boxName);
      _openBoxes[boxName] = box;
    }
    return _openBoxes[boxName]!;
  }

  /// This function is a utility that register [TypeAdapter]. If the adapter is already registered then
  /// the function has no effect.
  Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// A function that stores the [value] into it's appropriate [Box] as a pair of [key] - [value].
  ///
  /// If [debounce] is set to true then a [Timer] is created. The timer waits the [debounceDuration] to pass,
  /// then it saves the [value] into the [Box]. If the time didn't expire, but another save request is made, then
  /// the [Timer] resets back to the [debounceDuration] and the newest value would be saved.
  ///
  /// Set [debounce] utility to `true` if the operation request many save operation in a short amount of time.
  /// For example, it is useaful when a Slider changes is value very frequently. Then the save operation is not saved in file
  /// since the [Timer] does not have enough time to expire and is frequently canceled. In this situation the IO operation is done only once.
  ///
  /// The [debounce] is default to `false`
  Future<void> save<T>({
    required String key,
    required T value,
    bool debounce = false,
    Duration debounceDuration = const Duration(milliseconds: 500),
  }) async {
    _checkInitialized();
    final boxName = _getBoxName<T>();

    saveOperation() async {
      final box = await _openBox(boxName);
      await box.put(key, value);
    }

    if (debounce) {
      _debounce<T>(key, saveOperation, debounceDuration);
    } else {
      await saveOperation();
    }
  }

  /// It loads the requested [key] from the appropriate [Box]. The [Box] is determined using the generic [Type].
  Future<T?> load<T>(String key) async {
    _checkInitialized();
    final boxName = _getBoxName<T>();
    final box = await _openBox(boxName);
    return box.get(key) as T?;
  }

  /// It loads all the elements from the appropriate [Box]. The box is infered using its generic [Type].
  Future<List<T>> loadAll<T>() async {
    _checkInitialized();
    final boxName = _getBoxName<T>();
    final box = await _openBox(boxName);
    final delements = box.values;
    final elements = delements.map((e) => e as T);
    return elements.toList();
  }

  /// It deletes the appropriate [Box] associated with the [key].
  ///
  /// Note that this opperation will delete all the [Box] information from the disk.
  Future<void> delete<T>(String key) async {
    _checkInitialized();
    final boxName = _getBoxName<T>();
    final box = await _openBox(boxName);
    await box.delete(key);
  }

  Future<void> clear<T>() async {
    _checkInitialized();
    final boxName = _getBoxName<T>();
    final box = await _openBox(boxName);
    await box.clear();
  }

  void _debounce<T>(String key, Function() action, Duration duration) {
    final compKey = '${T.toString()}-$key';
    _debouncers[compKey]?.cancel();
    _debouncers[compKey] = Timer(duration, () {
      action();
      _debouncers.remove(compKey);
    });
  }

  /// It cancels and stops all the [Timer]s from the [_debouncers].
  Future<void> flushDebounced() async {
    await Future.wait(
      _debouncers.values.map((timer) async {
        timer.cancel();
      }),
    );
    _debouncers.clear();
  }

  String _getBoxName<T>() {
    final boxName = _boxRegistration[T];
    if (boxName == null) {
      throw Exception('No box registered for type ${T.toString()}');
    }
    return boxName;
  }

  void _checkInitialized() {
    if (!_isIntialized) {
      throw Exception('HiveService not initialized. Call init() first');
    }
  }

  Future<void> close() async {
    await flushDebounced();
    await Future.wait(_openBoxes.values.map((box) => box.close()));
    _openBoxes.clear();
    _isIntialized = false;
  }
}
