import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// A widget that represents a card for project mode.
///
/// This widget is used to select the mode of a project in the project creation process.
/// It is a part of the project creation page and is displayed when the user selects a project mode.
class ProjectModeCard extends ConsumerWidget {
  const ProjectModeCard({
    super.key,
    required this.mode,
    this.isSelected = false,
    required this.onSelected,
  });

  /// The mode of the project.
  /// This is used to determine the type of project being created.
  /// It can be one of [ProjectMode.auto], [ProjectMode.singleRGB],  [ProjectMode.multipleRGB] , [ProjectMode.singleRGBD] or [ProjectMode.multipleRGBD].
  ///
  /// If [ProjectMode.auto] is selected, then the app will automaticly infer the mode from the data.
  ///
  /// Default is [ProjectMode.auto].
  final ProjectMode mode;

  final bool isSelected;

  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: 200.ms,

        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            side: BorderSide(
              color: isSelected ? colors.primary : colors.outline,
              width: isSelected ? 2.0 : 1.0,
            ),
          ),

          child: Column(
            children: [
              const SizedBox(height: 8.0),
              Image(
                height: 100,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${mode.value}.jpeg'),
              ),
              const SizedBox(height: 8.0),
              Text(
                mode.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected ? colors.primary : colors.onSurface,
                ),
              ),
            ],
          ).animate().fadeIn(
            duration: 300.ms,
            curve: Curves.easeInOut,
            begin: 0.0,
            delay: 100.ms,
          ),
        ),
      ),
    );
  }
}
