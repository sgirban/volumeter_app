import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/utils/project/assets_utils.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';

class AssetsProviderNotifier extends StateNotifier<List<ImageAsset>> {
  AssetsProviderNotifier() : super([]);

  void addAsset(ImageAsset asset) {
    state = [...state, asset]..sort((a, b) => a.name.compareTo(b.name));
  }

  void removeAsset(String id) {
    state = state.where((asset) => asset.id != id).toList();
  }

  void updateAsset(String id, ImageAsset newAsset) {
    state = [...state..removeWhere((e) => e.id == id), newAsset]
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  void clearAssets() {
    state = [];
  }

  void loadAllAssets(ProjectMetadata project) async {
    final assets = await compute(loadAssets, project);
    state = assets;
  }

  void importAsset(File file, ProjectMetadata project) async {
    debugPrint('Importing asset: ${file.path} to ${project.path}');
    final asset = await importAssets(file, project);
    if (asset != null) {
      addAsset(asset);
    }
  }

  void importAssetByDrag(
    Uint8List bytes,
    String name,
    ProjectMetadata project,
  ) async {
    debugPrint('Importing asset: $name to ${project.path}');
    final asset = await importAssetsByDrag(bytes, name, project);
    if (asset != null) {
      addAsset(asset);
    }
  }

  ImageAsset? getAssetById(String id) {
    return state.where((asset) => asset.id == id).firstOrNull;
  }
}

/// The provider can be used to access the list of assets and perform operations on it.
final assetsProvider =
    StateNotifierProvider<AssetsProviderNotifier, List<ImageAsset>>(
      (ref) => AssetsProviderNotifier(),
    );

final assetsClipboardProvider = StateProvider<ImageAsset?>((ref) => null);
