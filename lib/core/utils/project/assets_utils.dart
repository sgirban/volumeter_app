import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:uuid/uuid.dart';
import 'package:volumeter/features/projects/domain/models/assets_manifest.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';

Future<List<ImageAsset>> loadAssets(ProjectMetadata project) async {
  final assetsMenifest = File('${project.path}/assets/assets_manifest.json');
  if (!assetsMenifest.existsSync()) {
    throw Exception('Assets manifest file not found');
  }
  final manifestContent = await assetsMenifest.readAsString();
  final manifest = AssetsManifest.fromJson(jsonDecode(manifestContent));
  final assets = manifest.assets;
  return assets;
}

Future<void> updateAsset(ImageAsset asset, Uint8List bytes) async {
  final file = File(asset.path);
  await file.writeAsBytes(bytes);
}

Future<void> updateAssetsManifest(Map<String, dynamic> args) async {
  final project = args['project'] as ProjectMetadata;
  final assets = args['assets'] as ImageAsset;
  final isDepth = args['isDepth'] as bool?;
  final assetsMenifest = File('${project.path}/assets/assets_manifest.json');
  if (!assetsMenifest.existsSync()) {
    throw Exception('Assets manifest file not found');
  }
  final manifestContent = await assetsMenifest.readAsString();
  final manifest = AssetsManifest.fromJson(jsonDecode(manifestContent));
  final updatedManifest =
      (isDepth == null || isDepth == false)
          ? AssetsManifest(
            assets: [
              ...(manifest.assets..removeWhere((e) => e.id == assets.id)),
              assets,
            ]..sort((a, b) => a.name.compareTo(b.name)),
          )
          : AssetsManifest(
            assets: [
              ...(manifest.assets..removeWhere((e) => e.id == assets.id)),
            ]..sort((a, b) => a.name.compareTo(b.name)),
            depths: [
              ...(manifest.depths..removeWhere((e) => e.id == assets.id)),
              assets,
            ],
          );
  await assetsMenifest.writeAsString(jsonEncode(updatedManifest.toJson()));
}

Future<ImageAsset?> importAssets(File file, ProjectMetadata project) async {
  try {
    // Load the image
    final imageBytes = await file.readAsBytes();
    final codec = await ui.instantiateImageCodec(imageBytes);
    final frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    // Convert to PNG
    final pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);

    // Saving the image to the assets directory
    final assetsDirectory =
        project.mode.isRGB
            ? Directory('${project.path}/assets/rgb/')
            : Directory('${project.path}/assets/rgbd/rgb');
    final outputPath =
        '${assetsDirectory.path}/${file.uri.pathSegments.last.split('.').first}.png';
    late final File outputFile;
    if (await File(outputPath).exists()) {
      outputFile = File(
        '${assetsDirectory.path}/${file.uri.pathSegments.last.split('.').first}_copy.png',
      );
    } else {
      outputFile = File(outputPath);
    }
    await outputFile.create();
    await outputFile.writeAsBytes(pngBytes!.buffer.asUint8List());
    final imageAsset = ImageAsset(
      id: const Uuid().v4(),
      name: file.uri.pathSegments.last.split('.').first,
      path: outputPath,
      type: AssetType.rgb,
    );
    compute(updateAssetsManifest, {'project': project, 'assets': imageAsset});
    return imageAsset;
  } catch (e) {
    debugPrint("Error processing file: $e");
    return null;
  }
}

Future<void> linkDepthImage(
  ImageAsset rgb,
  ImageAsset depth,
  ProjectMetadata project,
) async {
  final rgbImage = File(rgb.path);
  final depthImage = File(depth.path);
  if (!rgbImage.existsSync() || !depthImage.existsSync()) {
    throw Exception('One or both image files that we try to link do not exist');
  }
  final rgbBytes = await rgbImage.readAsBytes();
  final depthBytes = await depthImage.readAsBytes();
  final rgbNewFile = File('${project.path}/assets/rgbd/rgb/${rgb.name}.png');
  rgbNewFile.create();
  final depthNewFile = File(
    '${project.path}/assets/rgbd/depth/${rgb.name}_depth.png',
  );
  depthNewFile.create();
  await rgbNewFile.writeAsBytes(rgbBytes);
  await depthNewFile.writeAsBytes(depthBytes);
  await updateAssetsManifest({
    'project': project,
    'assets': rgb.copyWith(
      path: rgbNewFile.path,
      type: AssetType.rgb,
      isPaired: true,
      pairedAssetId: depth.id,
    ),
  });
  await updateAssetsManifest({
    'project': project,
    'assets': depth.copyWith(
      type: AssetType.depth,
      path: '${project.path}/assets/rgbd/depth/${rgb.name}_depth.png',
      name: '${rgb.name}_depth',
      isPaired: true,
      pairedAssetId: rgb.id,
    ),
    'isDepth': true,
  });
  await rgbImage.delete();
  await depthImage.delete();
}

Future<ImageAsset?> importAssetsByDrag(
  Uint8List bytes,
  String name,
  ProjectMetadata project,
) async {
  try {
    // Load the image
    final imageBytes = bytes;
    final codec = await ui.instantiateImageCodec(imageBytes);
    final frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    // Convert to PNG
    final pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);

    // Saving the image to the assets directory
    final assetsDirectory =
        project.mode.isRGB
            ? Directory('${project.path}/assets/rgb')
            : Directory('${project.path}/assets/rgbd/rgb');
    final outputPath = '${assetsDirectory.path}/${name.split('.').first}.png';
    late final File outputFile;
    if (await File(outputPath).exists()) {
      outputFile = File(
        '${assetsDirectory.path}/${name.split('.').first}_copy.png',
      );
    } else {
      outputFile = File(outputPath);
    }
    await outputFile.create();
    await outputFile.writeAsBytes(pngBytes!.buffer.asUint8List());
    final imageAsset = ImageAsset(
      id: const Uuid().v4(),
      name: name.split('.').first,
      path: outputPath,
      type: AssetType.rgb,
    );
    compute(updateAssetsManifest, {'project': project, 'assets': imageAsset});
    return imageAsset;
  } catch (e) {
    debugPrint("Error processing file: $e");
    return null;
  }
}

Future<void> deleteAsset(ImageAsset asset, ProjectMetadata project) async {
  final file = File(asset.path);

  final assetsMenifest = File('${project.path}/assets/assets_manifest.json');
  if (!assetsMenifest.existsSync()) {
    throw Exception('Assets manifest file not found');
  }
  if (await file.exists()) {
    await file.delete();
  }
  final manifestContent = await assetsMenifest.readAsString();
  final manifest = AssetsManifest.fromJson(jsonDecode(manifestContent));
  manifest.assets.removeWhere((a) => a.id == asset.id);
  if (asset.pairedAssetId != null) {
    final pairedPath =
        manifest.depths
            .where((a) => a.id == asset.pairedAssetId)
            .firstOrNull
            ?.path;
    if (pairedPath == null) {
      return;
    }
    final pairedFile = File(pairedPath);
    await pairedFile.delete();
    manifest.depths.removeWhere((a) => a.id == asset.pairedAssetId);
  }

  await assetsMenifest.writeAsString(jsonEncode(manifest.toJson()));
}

Future<void> renameIOAsset(
  ImageAsset asset,
  String newName,
  ProjectMetadata project,
) async {
  final assetsMenifest = File('${project.path}/assets/assets_manifest.json');
  if (!assetsMenifest.existsSync()) {
    throw Exception('Assets manifest file not found');
  }
  final manifestContent = await assetsMenifest.readAsString();
  final manifest = AssetsManifest.fromJson(jsonDecode(manifestContent));
  final nasset = manifest.assets.where((a) => a.id == asset.id).firstOrNull;
  if (nasset == null) {
    return;
  }
  manifest.assets.removeWhere((a) => a.id == asset.id);
  manifest.assets.add(nasset.copyWith(name: newName.split('.').first));
  if (asset.pairedAssetId != null) {
    final pairedAsset =
        manifest.depths.where((a) => a.id == asset.pairedAssetId).firstOrNull;
    if (pairedAsset == null) {
      return;
    }
    manifest.depths.removeWhere((a) => a.id == asset.pairedAssetId);
    manifest.depths.add(pairedAsset.copyWith(name: newName.split('.').first));
  }
  await assetsMenifest.writeAsString(jsonEncode(manifest.toJson()));
}

Future<void> generateAsset({
  required String name,
  required int width,
  required int height,
  required Color color,
  required ProjectMetadata project,
}) async {
  final image = img.Image(width: width, height: height, numChannels: 4);

  final img.Color fillColor = img.ColorInt32.rgba(
    (color.r * 255).clamp(0, 255).toInt(),
    (color.g * 255).clamp(0, 255).toInt(),
    (color.b * 255).clamp(0, 255).toInt(),
    (color.a * 255).clamp(0, 255).toInt(),
  );

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      image.setPixel(x, y, fillColor);
    }
  }
  final pngBytes = img.encodePng(image);
  final imgFile = File(
    '${project.path}/assets/rgb/${name.split('.').first}.png',
  );
  await imgFile.writeAsBytes(pngBytes);
  updateAssetsManifest({
    'project': project,
    'assets': ImageAsset(
      id: const Uuid().v4(),
      name: name,
      path: imgFile.path,
      type: AssetType.rgb,
    ),
  });
}
