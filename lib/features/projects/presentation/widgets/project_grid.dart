import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/projects/presentation/widgets/project_card.dart';
import 'package:volumeter/providers/projects_provider.dart';

class ProjectGrid extends ConsumerStatefulWidget {
  const ProjectGrid({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectGridState();
}

class _ProjectGridState extends ConsumerState<ProjectGrid> {
  final _gridViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        key: _gridViewKey,
        itemCount: projects.length,
        gridDelegate:
            context.mobileLayout
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1.3,
                )
                : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1.3,
                ),
        itemBuilder: (context, index) {
          return ProjectCard(
            key: Key(index.toString()),
            project: projects[index],
          );
        },
      ),
    );
  }
}
