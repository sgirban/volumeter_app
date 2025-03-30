import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/project/create_project_io.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/features/projects/presentation/widgets/project_mode_grid.dart';
import 'package:volumeter/providers/projects_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';

class CreateProjectDialog extends ConsumerStatefulWidget {
  const CreateProjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProjectDialogState();
}

class _CreateProjectDialogState extends ConsumerState<CreateProjectDialog> {
  final _formKey = GlobalKey<fluent.FormState>();
  String? _projectName;
  ProjectMode _selectedMode = ProjectMode.auto;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final themeColors = ref.read(themeProvider.select((s) => s.colors));
    final localizations = context.localizations;
    if (isDesktopWeb) {
      return fluent.ContentDialog(
        title: Text(localizations.create),
        actions: [
          fluent.Button(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(localizations.cancel),
          ),
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate() == true &&
              !isLoading)
            fluent.FilledButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final project = await createProjectIO(
                  projectName: _projectName!,
                  mode: _selectedMode,
                );

                if (mounted) {
                  if (project != null) {
                    ref.read(projectProvider.notifier).addProject(project);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: Text(localizations.create),
            ),
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate() == true &&
              isLoading)
            const fluent.ProgressRing(),
          if (_formKey.currentState == null ||
              _formKey.currentState!.validate() == false)
            AbsorbPointer(
              child: Opacity(
                opacity: 0.7,
                child: fluent.FilledButton(
                  onPressed: () {},
                  child: Text(localizations.create),
                ),
              ),
            ),
        ],
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700, maxHeight: 400),
          child: fluent.Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: fluent.Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    fluent.Center(
                      child: fluent.InfoLabel(
                        label: localizations.projectName,
                        child: fluent.TextFormBox(
                          placeholder: localizations.projectName,
                          expands: false,
                          maxLines: 1,
                          minLines: 1,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          style: fluent.TextStyle(
                            fontSize: 16.0,
                            color: themeColors.onSurface,
                          ),

                          //autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.replaceAll(' ', '').isEmpty) {
                              return localizations.projectMustNotBeEmpty;
                            }
                            if (RegExp(r'^[!@#$%^&*+,.?|\"]').hasMatch(value)) {
                              return localizations
                                  .projectMustNotHaveSpecialChar;
                            }
                            return null;
                          },

                          onChanged: (value) {
                            setState(() {
                              _projectName = value;
                            });
                          },
                          onEditingComplete: () => setState(() {}),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(localizations.projectType),
                        const SizedBox(height: 8.0),
                        ProjectModeGrid(
                          onChanged: (mode) {
                            _selectedMode = mode;
                          },
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

    /// Mobile Dialog
    ///
    ///
    return Dialog(
      child: fluent.Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: fluent.Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      localizations.createProject,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Center(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.replaceAll(' ', '').isEmpty) {
                            return localizations.projectMustNotBeEmpty;
                          }
                          if (RegExp(r'^[!@#$%^&*+,.?|\"]').hasMatch(value)) {
                            return localizations.projectMustNotHaveSpecialChar;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _projectName = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: localizations.projectName,
                          focusColor: themeColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(localizations.projectType),
                        const SizedBox(height: 8.0),
                        ProjectModeGrid(
                          onChanged: (mode) {
                            _selectedMode = mode;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(localizations.cancel),
                            ),
                            if (isLoading) const CircularProgressIndicator(),
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate() == true &&
                                !isLoading)
                              FilledButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final project = await createProjectIO(
                                    projectName: _projectName!,
                                    mode: _selectedMode,
                                  );

                                  if (mounted) {
                                    if (project != null) {
                                      ref
                                          .read(projectProvider.notifier)
                                          .addProject(project);
                                    }
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(localizations.create),
                              ),
                            if (_formKey.currentState == null ||
                                _formKey.currentState!.validate() == false)
                              AbsorbPointer(
                                child: Opacity(
                                  opacity: 0.7,
                                  child: FilledButton(
                                    onPressed: () {},
                                    child: Text(localizations.create),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
