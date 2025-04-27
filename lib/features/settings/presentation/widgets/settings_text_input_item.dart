import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';

class SettingsTextInputItem extends ConsumerStatefulWidget {
  const SettingsTextInputItem({
    super.key,
    required this.title,
    this.width = 200,
    this.initialValue,
    this.readonly = false,
    required this.onSubmitted,
    this.placeHolder,
    this.format,
    this.textAlignment = TextAlign.start,
  });
  final String title;
  final double width;
  final String? initialValue;
  final void Function(String value) onSubmitted;
  final bool readonly;
  final String? placeHolder;
  final RegExp? format;
  final TextAlign textAlignment;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsTextInputItemState();
}

class _SettingsTextInputItemState extends ConsumerState<SettingsTextInputItem> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return fluent.Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleSmall),
          const Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.width),
            child: _buildContent(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isDesktopWeb) {
      return fluent.TextFormBox(
        controller: textController,
        textAlign: widget.textAlignment,
        readOnly: widget.readonly,
        onEditingComplete: () => widget.onSubmitted(textController.text),
        onTapOutside: (_) => widget.onSubmitted(textController.text),
        placeholder: widget.placeHolder,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (widget.format != null) {
            if (!widget.format!.hasMatch(value ?? '')) {
              return 'Invalid';
            }
          }
          return null;
        },
      );
    }
    return TextFormField(
      controller: textController,
      readOnly: widget.readonly,
      onEditingComplete: () => widget.onSubmitted(textController.text),
      onTapOutside: (_) => widget.onSubmitted(textController.text),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.format != null) {
          if (!widget.format!.hasMatch(value ?? '')) {
            return 'Invalid';
          }
        }
        return null;
      },
      decoration: InputDecoration(hintText: widget.placeHolder),
    );
  }
}
