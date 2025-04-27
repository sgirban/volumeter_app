import 'package:fluent_ui/fluent_ui.dart' as fluent show FluentIcons;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_image_editor/core/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/core/models/editor_configs/pro_image_editor_configs.dart';
import 'package:pro_image_editor/core/models/layers/layer.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/appbar/frosted_glass_appbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/appbar/frosted_glass_blur_appbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/appbar/frosted_glass_filter_appbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/appbar/frosted_glass_paint_appbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/appbar/frosted_glass_tune_appbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/bottombar/frosted_glass_paint_bottombar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/bottombar/frosted_glass_tune_bottombar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/frosted_glass_close_dialog.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/frosted_glass_crop_rotate_toolbar.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/frosted_glass_loading_dialog.dart';
import 'package:pro_image_editor/designs/frosted_glass/widgets/frosted_glass_sticker_editor.dart';
import 'package:pro_image_editor/features/main_editor/main_editor.dart';
import 'package:pro_image_editor/features/paint_editor/paint_editor.dart';
import 'package:pro_image_editor/features/tune_editor/tune_editor.dart';
import 'package:pro_image_editor/shared/widgets/reactive_widgets/reactive_custom_widget.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/project/assets_utils.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class Workspace2dView extends ConsumerStatefulWidget {
  const Workspace2dView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Workspace2dViewState();
}

class _Workspace2dViewState extends ConsumerState<Workspace2dView> {
  /// Used to reference the state of the editor

  bool isDesktopMode(BuildContext context) => context.desktopLayout;

  /// Opens the sticker/emoji editor.
  void _openStickerEditor(ProImageEditorState editor) async {
    Layer? layer = await editor.openPage(
      FrostedGlassStickerPage(
        configs: editor.configs,
        callbacks: editor.callbacks,
      ),
    );

    if (layer == null || !mounted) return;

    if (layer.runtimeType != WidgetLayer) {
      layer.scale = editor.configs.emojiEditor.initScale;
    }

    editor.addLayer(layer);
  }

  @override
  /// Builds the widget tree for the 2D workspace view.
  ///
  /// This method returns the main image viewer widget, which is responsible
  /// for displaying and editing the currently selected image asset in the
  /// workspace. The widget is built using the provided [BuildContext].
  Widget build(BuildContext context) {
    ref.watch(workspaceProvider.select((s) => s.selectedAsset));
    return _buildImageViewer(context);
  }

  Widget _buildImageViewer(BuildContext context) {
    final editorKey = GlobalKey<ProImageEditorState>();
    return Consumer(
      builder: (context, ref, child) {
        final localizations = context.localizations;
        final id = ref.watch(workspaceProvider).selectedAsset.firstOrNull;
        final image =
            ref.watch(assetsProvider).where((e) => e.id == id).firstOrNull;
        if (image == null) return const Placeholder();
        return ProImageEditor.file(
          image.path,
          key: editorKey,

          /// Callbacks
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: (bytes) async {
              final assetId =
                  ref.read(workspaceProvider).selectedAsset.firstOrNull;
              if (assetId == null) return;

              final asset =
                  ref
                      .read(assetsProvider)
                      .where((e) => e.id == assetId)
                      .firstOrNull;
              if (asset == null) return;

              updateAsset(asset, bytes);
            },
          ),
          configs: ProImageEditorConfigs(
            theme: Theme.of(context).copyWith(
              iconTheme: Theme.of(
                context,
              ).iconTheme.copyWith(color: Colors.white),
            ),
            designMode: ImageEditorDesignMode.material,
            mainEditor: MainEditorConfigs(
              widgets: MainEditorWidgets(
                closeWarningDialog: (editor) async {
                  if (!context.mounted) return false;
                  return await showDialog<bool>(
                        context: context,
                        builder:
                            (BuildContext context) =>
                                FrostedGlassCloseDialog(editor: editor),
                      ) ??
                      false;
                },
                appBar: (editor, rebuildStream) => null,
                bottomBar: (editor, rebuildStream, key) => null,
                bodyItems: _buildMainBodyWidgets,
              ),
            ),
            paintEditor: PaintEditorConfigs(
              icons: PaintEditorIcons(
                bottomNavBar:
                    isDesktopWeb
                        ? fluent.FluentIcons.edit
                        : CupertinoIcons.pencil,
              ),
              widgets: PaintEditorWidgets(
                appBar: (paintEditor, rebuildStream) => null,
                bottomBar: (editorState, rebuildStream) => null,
                colorPicker:
                    (editorState, rebuildStream, currentColor, setColor) =>
                        null,
                bodyItems: _buildPaintEditorBody,
              ),
            ),
            cropRotateEditor: CropRotateEditorConfigs(
              widgets: CropRotateEditorWidgets(
                appBar: (cropRotateEditor, rebuildStream) => null,
                bottomBar:
                    (cropRotateEditor, rebuildStream) => ReactiveWidget(
                      stream: rebuildStream,
                      builder:
                          (_) => FrostedGlassCropRotateToolbar(
                            configs: cropRotateEditor.configs,
                            onCancel: cropRotateEditor.close,
                            onRotate: cropRotateEditor.rotate,
                            onDone: cropRotateEditor.done,
                            onReset: cropRotateEditor.reset,
                            openAspectRatios:
                                cropRotateEditor.openAspectRatioOptions,
                          ),
                    ),
              ),
            ),
            filterEditor: FilterEditorConfigs(
              style: const FilterEditorStyle(
                filterListSpacing: 7,
                filterListMargin: EdgeInsets.fromLTRB(8, 15, 8, 10),
              ),
              widgets: FilterEditorWidgets(
                slider:
                    (
                      editorState,
                      rebuildStream,
                      value,
                      onChanged,
                      onChangeEnd,
                    ) => ReactiveWidget(
                      stream: rebuildStream,
                      builder:
                          (_) => Slider(
                            onChanged: onChanged,
                            onChangeEnd: onChangeEnd,
                            value: value,
                            activeColor: Colors.blue.shade200,
                          ),
                    ),
                appBar: (filterEditor, rebuildStream) => null,
                bodyItems:
                    (filterEditor, rebuildStream) => [
                      ReactiveWidget(
                        stream: rebuildStream,
                        builder:
                            (_) => FrostedGlassFilterAppbar(
                              filterEditor: filterEditor,
                            ),
                      ),
                    ],
              ),
            ),

            tuneEditor: TuneEditorConfigs(
              widgets: TuneEditorWidgets(
                appBar: (filterEditor, rebuildStream) => null,
                bottomBar: (filterEditor, rebuildStream) => null,
                bodyItems: _buildTuneEditorBody,
              ),
            ),
            blurEditor: BlurEditorConfigs(
              widgets: BlurEditorWidgets(
                slider:
                    (
                      editorState,
                      rebuildStream,
                      value,
                      onChanged,
                      onChangeEnd,
                    ) => ReactiveWidget(
                      stream: rebuildStream,
                      builder:
                          (_) => Slider(
                            onChanged: onChanged,
                            onChangeEnd: onChangeEnd,
                            value: value,
                            max: editorState.configs.blurEditor.maxBlur,
                            activeColor: Colors.blue.shade200,
                          ),
                    ),
                appBar: (blurEditor, rebuildStream) => null,
                bodyItems:
                    (blurEditor, rebuildStream) => [
                      ReactiveWidget(
                        stream: rebuildStream,
                        builder:
                            (_) =>
                                FrostedGlassBlurAppbar(blurEditor: blurEditor),
                      ),
                    ],
              ),
            ),

            dialogConfigs: DialogConfigs(
              widgets: DialogWidgets(
                loadingDialog:
                    (message, configs) => FrostedGlassLoadingDialog(
                      message: message,
                      configs: configs,
                    ),
              ),
            ),
            layerInteraction: const LayerInteractionConfigs(
              style: LayerInteractionStyle(
                removeAreaBackgroundInactive: Colors.black12,
              ),
            ),

            i18n: I18n(
              redo: localizations.redo,
              undo: localizations.undo,
              done: localizations.done,
              cancel: localizations.cancel,
              doneLoadingMsg: localizations.doneLoadingMsg,
              various: I18nVarious(
                loadingDialogMsg: localizations.loadingDialogMsg,
                closeEditorWarningTitle: localizations.closeEditorWarningTitle,
                closeEditorWarningCancelBtn:
                    localizations.closeEditorWarningCancelBtn,
                closeEditorWarningMessage:
                    localizations.closeEditorWarningMessage,
              ),
              paintEditor: I18nPaintEditor(
                freestyle: localizations.freestyle,
                eraser: localizations.eraser,
                line: localizations.line,
                circle: localizations.circle,
                rectangle: localizations.rectangle,
                arrow: localizations.arrow,
                undo: localizations.undo,
                redo: localizations.redo,
                done: localizations.done,
                back: localizations.back,
                bottomNavigationBarText:
                    localizations.pebottomNavigationBarText,
              ),
              tuneEditor: I18nTuneEditor(
                back: localizations.back,
                done: localizations.done,
                undo: localizations.undo,
                redo: localizations.redo,
                bottomNavigationBarText:
                    localizations.tuneBottomNavigationBarText,
              ),
              filterEditor: I18nFilterEditor(
                bottomNavigationBarText:
                    localizations.filterBottomNavigationBarText,
                back: localizations.back,
                done: localizations.done,
              ),
              blurEditor: const I18nBlurEditor(),
              emojiEditor: I18nEmojiEditor(
                locale: Locale(context.localizations.localeName),
              ),
            ),
          ),
        );
      },
    );
  }

  List<ReactiveWidget> _buildMainBodyWidgets(
    ProImageEditorState editor,
    Stream<dynamic> rebuildStream,
  ) {
    return [
      if (editor.selectedLayerIndex < 0)
        ReactiveWidget(
          stream: rebuildStream,
          builder:
              (_) => FrostedGlassActionBar(
                editor: editor,
                openStickerEditor: () => _openStickerEditor(editor),
              ),
        ),
    ];
  }

  List<ReactiveWidget> _buildPaintEditorBody(
    PaintEditorState paintEditor,
    Stream<dynamic> rebuildStream,
  ) {
    return [
      /// Appbar
      ReactiveWidget(
        stream: rebuildStream,
        builder: (_) {
          return paintEditor.isActive
              ? const SizedBox.shrink()
              : FrostedGlassPaintAppbar(paintEditor: paintEditor);
        },
      ),

      /// Bottombar
      ReactiveWidget(
        stream: rebuildStream,
        builder: (_) => FrostedGlassPaintBottomBar(paintEditor: paintEditor),
      ),
    ];
  }

  List<ReactiveWidget> _buildTuneEditorBody(
    TuneEditorState tuneEditor,
    Stream<dynamic> rebuildStream,
  ) {
    return [
      /// Appbar
      ReactiveWidget(
        stream: rebuildStream,
        builder: (_) {
          return FrostedGlassTuneAppbar(tuneEditor: tuneEditor);
        },
      ),

      /// Bottombar
      ReactiveWidget(
        stream: rebuildStream,
        builder: (_) => FrostedGlassTuneBottombar(tuneEditor: tuneEditor),
      ),
    ];
  }
}
