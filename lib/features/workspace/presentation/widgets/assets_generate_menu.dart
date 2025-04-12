import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/project/assets_utils.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class AssetsGenerateMenu extends ConsumerStatefulWidget {
  const AssetsGenerateMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AssetsGenerateMenuState();
}

class _AssetsGenerateMenuState extends ConsumerState<AssetsGenerateMenu> {
  int _width = 512;
  int _height = 512;
  Color _color = Colors.white;
  String _name = 'Generated_Asset';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: fluent.Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            fluent.InfoLabel(
              label: context.localizations.name,
              child: fluent.TextBox(
                placeholder: context.localizations.name,
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            fluent.InfoLabel(
              label: context.localizations.width,
              child: fluent.NumberBox(
                min: 10,
                value: _width,
                onChanged: (value) {
                  setState(() {
                    _width = value ?? 0;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            fluent.InfoLabel(
              label: context.localizations.height,
              child: fluent.NumberBox(
                min: 10,
                value: _height,
                onChanged: (value) {
                  setState(() {
                    _height = value ?? 0;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            fluent.ColorPicker(
              color: _color,
              onChanged: (value) {
                setState(() {
                  _color = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                fluent.Button(
                  child: Text(context.localizations.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                fluent.FilledButton(
                  child: Text(context.localizations.generate),
                  onPressed: () {
                    generateAsset(
                      name: _name,
                      width: _width,
                      height: _height,
                      color: _color,
                      project: ref.read(workspaceProvider).project,
                    ).then((_) {
                      ref
                          .read(assetsProvider.notifier)
                          .loadAllAssets(ref.read(workspaceProvider).project);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
