import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/constants/fonts.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/providers/theme_provider.dart';

class FontCardCombo extends ConsumerWidget {
  const FontCardCombo({
    super.key,
    this.height = 230,
    required this.selectedFont,
    required this.onChanged,
    this.selectedKey,
  });
  final double height;
  final String selectedFont;
  final void Function(String font) onChanged;
  final GlobalKey? selectedKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    final text = ref.watch(themeProvider.select((s) => s.text));
    final locale = context.localizations;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(locale.primaryFont, style: text.titleMedium),
          ),
        ),

        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fonts.length,
            itemBuilder: (context, index) {
              final isSelected = selectedFont == fonts[index];
              return AnimatedScale(
                key: selectedKey,
                scale: isSelected ? 1 : 0.9,
                duration: 300.ms,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  child: GestureDetector(
                    onTap: () => onChanged(fonts[index]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        side: BorderSide(
                          color: isSelected ? colors.primary : colors.outline,
                          width: isSelected ? 1.7 : 0.7,
                        ),
                      ),
                      color: colors.cardColor,
                      elevation: isSelected ? 5 : 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Aa',
                              style: text.headlineLarge.copyWith(
                                fontFamily: fonts[index],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              fonts[index],
                              style: text.titleMedium.copyWith(
                                fontFamily: fonts[index],
                              ),
                            ),
                            const Spacer(flex: 3),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Aa Bb Cc 123',
                                style: text.bodyLarge.copyWith(
                                  fontFamily: fonts[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
