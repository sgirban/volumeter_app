import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/workspace/presentation/widgets/asset_pannel.dart';
import 'package:volumeter/providers/theme_provider.dart';

class DesktopSidePannel extends ConsumerStatefulWidget {
  const DesktopSidePannel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopSidePannelState();
}

class _DesktopSidePannelState extends ConsumerState<DesktopSidePannel> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    ref.watch(themeProvider.select((s) => s.colors));
    final localizations = context.localizations;
    final tabs = [
      /// Assets tab
      Tab(text: Text(localizations.assets), body: const AssetPannel()),

      /// Tool property tab
      Tab(
        text: Text(localizations.toolProperties),
        body: Container(color: Colors.purple),
      ),
    ];
    return TabView(
      currentIndex: tabIndex,
      onChanged: (value) => setState(() => tabIndex = value),
      onReorder: (oldIndex, newIndex) {
        tabs.insert(newIndex, tabs.removeAt(oldIndex));
      },

      /// Tabs
      tabs: tabs,
    );
  }
}
