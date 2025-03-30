import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/features/projects/presentation/widgets/project_mode_card.dart';

class ProjectModeGrid extends ConsumerStatefulWidget {
  const ProjectModeGrid({super.key, required this.onChanged});

  final void Function(ProjectMode mode) onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectModeGridState();
}

class _ProjectModeGridState extends ConsumerState<ProjectModeGrid> {
  ProjectMode _selectedMode = ProjectMode.auto;
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          context.mobileLayout
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.7,
              )
              : const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.95,
              ),
      children:
          ProjectMode.values
              .map(
                (e) => ProjectModeCard(
                  mode: e,
                  isSelected: _selectedMode == e,
                  onSelected: () {
                    widget.onChanged;
                    setState(() {
                      _selectedMode = e;
                    });
                  },
                ),
              )
              .toList(),
    );
  }
}
