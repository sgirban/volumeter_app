import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/routes/router.dart';
import 'package:volumeter/features/settings/domain/models/settings_category.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// This Widget displays Card with an [Icon] in the left and short [Text] in the right
///
/// This widget is mainly used with a [GridView] or other  to display some settings categories.
/// It takes an [SettingsCategory] model item to display the UI component
class SettingsCategoryCard extends ConsumerStatefulWidget {
  const SettingsCategoryCard({super.key, required this.category});

  /// The category model used to display UI widget informations
  final SettingsCategory category;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsCategoryCardState();
}

class _SettingsCategoryCardState extends ConsumerState<SettingsCategoryCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    if (isDesktopWeb) {
      return MouseRegion(
        onEnter: (event) {
          setState(() {
            _hovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _hovered = false;
          });
        },

        child: GestureDetector(
          onTap: () {
            router.push('/settings/${widget.category.id}');
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side:
                  _hovered
                      ? BorderSide(color: colors.softBlue!, width: 1)
                      : BorderSide(color: colors.outline, width: 0),
            ),
            elevation: _hovered ? 2.0 : 1.0,
            color: colors.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.category.icon, size: 40, color: colors.softBlue),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.category.title,
                          style: textTheme.titleLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colors.softBlue,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),
                        Text(
                          widget.category.subtitle,
                          style: textTheme.bodyMedium.copyWith(
                            color: colors.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side:
            _hovered
                ? BorderSide(color: colors.softBlue!, width: 1)
                : BorderSide(color: colors.outline, width: 0),
      ),
      elevation: _hovered ? 2.0 : 1.0,
      color: colors.cardColor,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          router.push('/settings/${widget.category.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.category.icon, size: 40, color: colors.softBlue),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.category.title,
                    style: textTheme.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.softBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.category.subtitle,
                    style: textTheme.bodyMedium.copyWith(
                      color: colors.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
