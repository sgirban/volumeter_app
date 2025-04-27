import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class FileImportZone extends ConsumerStatefulWidget {
  const FileImportZone({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FileImportZoneState();
}

class _FileImportZoneState extends ConsumerState<FileImportZone> {
  bool isHovering = false;
  bool isProcessing = false;
  bool isSuccess = false;
  final List<Widget> files = [];

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: [
        Formats.bmp,
        Formats.png,
        Formats.jpeg,
        Formats.zip,
        Formats.sevenZip,
      ],
      onDropOver: _onDropOver,
      onPerformDrop: _onPerformDrop,
      onDropLeave: _onDropLeave,
      onDropEnter: _onDropEnter,
      child: _buildImportZone(context),
    );
  }

  Widget _buildImportZone(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200, minWidth: 400),
      child: DottedBorder(
        radius: const Radius.circular(12.0),
        borderType: BorderType.RRect,
        dashPattern: [6, 7],
        strokeWidth: 2,
        strokeCap: StrokeCap.round,
        color:
            isHovering ? Theme.of(context).colorScheme.primary : Colors.black38,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Container(
              color:
                  isHovering
                      ? Theme.of(context).colorScheme.primary.withAlpha(50)
                      : Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        isHovering
                            ? Icon(
                              CupertinoIcons.doc_on_doc,
                              size: 50,
                              color: Theme.of(context).colorScheme.primary,
                            )
                            : const Icon(
                              CupertinoIcons.doc,
                              size: 50,
                              color: Colors.black38,
                            ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localizations.dragImageHere,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _pickFiles(context),
                        child: Text(
                          context.localizations.browse,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      for (var file in result.files) {
        await _processFile(File(file.path!));
      }
    }
    if (context.mounted && context.canPop()) {
      context.pop();
    }
  }

  Future<void> _onPerformDrop(PerformDropEvent event) async {
    final item = event.session.items.first;
    final reader = item.dataReader!;
    if (reader.canProvide(Formats.png)) {
      reader.getFile(Formats.png, (value) async {
        final fileStream = value.readAll();

        try {
          // Load the image
          final imageBytes = await fileStream;
          final codec = await ui.instantiateImageCodec(imageBytes);
          final frame = await codec.getNextFrame();
          final ui.Image image = frame.image;

          // Convert to PNG
          final pngBytes = await image.toByteData(
            format: ui.ImageByteFormat.png,
          );

          // Save to a specified path
          final outputPath =
              'C:/Users/savag/Downloads/${value.fileName}_converted.png';
          final outputFile = File(outputPath);
          await outputFile.create();
          await outputFile.writeAsBytes(pngBytes!.buffer.asUint8List());
        } catch (e) {
          debugPrint("Error processing file: $e");
        }
      });
    } else if (reader.canProvide(Formats.jpeg)) {
      reader.getFile(Formats.jpeg, (value) async {
        final file = await value.readAll();
        ref
            .read(assetsProvider.notifier)
            .importAssetByDrag(
              file,
              value.fileName ?? 'asset',
              ref.read(workspaceProvider).project,
            );
      });
    }
    setState(() {
      isHovering = false;
    });
    if (context.mounted) {
      context.pop();
    }
  }

  Future<void> _processFile(File file) async {
    ref
        .read(assetsProvider.notifier)
        .importAsset(file, ref.read(workspaceProvider).project);
  }

  FutureOr<DropOperation> _onDropOver(DropOverEvent event) {
    if (event.session.allowedOperations.contains(DropOperation.copy)) {
      setState(() {
        isHovering = true;
      });
      return DropOperation.copy;
    } else {
      setState(() {
        isHovering = false;
      });
      return DropOperation.none;
    }
  }

  void _onDropLeave(DropEvent event) {
    setState(() {
      isHovering = false;
    });
  }

  void _onDropEnter(DropEvent event) {
    setState(() {
      isHovering = true;
    });
  }
}
