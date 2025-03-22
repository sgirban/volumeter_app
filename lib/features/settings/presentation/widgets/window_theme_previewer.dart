import 'package:flutter/material.dart';
import 'package:volumeter/core/theme/app_colors.dart';

/// This Widget is used to create a window style card prototype
/// useaful to ilustrate the color scheme and give the theme vibe to the user.
///
/// This widget is perferable to used wth a radio style widget
class WindowThemePreviewer extends StatelessWidget {
  const WindowThemePreviewer({super.key, required this.colorScheme});

  /// The [AppColors] is used as color scheme to build up the window. The `primary` color and `secondary` color
  /// are used to color the buttons, `surface` is used to color the background and `outline` color and `outlineVariant` are used
  /// for coloring the soft outlines and [BorderSide]s.
  final AppColors colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
            color: Color(0x40000000),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 12,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 12,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 12,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 12,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 12,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 50,
                        decoration: BoxDecoration(
                          color: colorScheme.inverseSurface?.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: colorScheme.inverseSurface?.withValues(
                            alpha: 0.2,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.cardColor,
                          border: Border.fromBorderSide(
                            BorderSide(color: colorScheme.outline),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
