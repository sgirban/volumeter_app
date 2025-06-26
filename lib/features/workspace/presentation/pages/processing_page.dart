import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/core/utils/project/process_project.dart';
import 'package:volumeter/protos/generated/volume_estimation.pb.dart'
    show ProcessingStatus;
import 'package:volumeter/providers/workspace_provider.dart';

class ProcessingPage extends ConsumerStatefulWidget {
  const ProcessingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends ConsumerState<ProcessingPage> {
  @override
  Widget build(BuildContext context) {
    final workspace = ref.watch(workspaceProvider);
    return FutureBuilder<Stream<ProcessingStatus>>(
      future: processProject(workspace.project),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          logger.e('Error processing project: ${snapshot.error}');
          return const Center(child: Text('Error processing project'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final stream = snapshot.data!;
        return StreamBuilder<ProcessingStatus>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              logger.e('Error processing project: ${snapshot.error}');
              return const Center(child: Text('Error processing project'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            }

            final status = snapshot.data!;
            return Column(
              children: [
                _buildAnimation(context, status),
                const SizedBox(height: 32),
                Center(
                  child: Text('Processing status: ${status.currentStage} '),
                ),
                const SizedBox(height: 32),
                Center(child: ProgressBar(value: status.progress * 100)),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAnimation(BuildContext context, ProcessingStatus status) {
    if (status.currentStage.toString() == 'UPLOADING' &&
        status.progress < 1.0) {
      return Lottie.asset(
        'assets/lotties/Animation-uploading.json',
        height: 200,
        fit: BoxFit.fill,
        repeat: true,
      );
    }
    if (status.currentStage.toString() == 'FUSING' && status.progress < 1.0) {
      return Lottie.asset(
        'assets/lotties/Animation-fusing.json',
        height: 200,
        fit: BoxFit.fill,
        repeat: true,
      );
    }

    return Lottie.asset(
      'assets/lotties/Animation-done_uploading.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
      repeat: false,
    );
  }
}
