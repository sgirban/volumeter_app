import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';

class NetworkInfoSettingItem extends ConsumerWidget {
  const NetworkInfoSettingItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = context.localizations;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                localizations.ipv4,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              FutureBuilder(
                future: Ipify.ipv4(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }
                  return Text(
                    '-',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
              const SizedBox(width: 32.0),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                localizations.ipv6,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              FutureBuilder(
                future: Ipify.ipv64(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }
                  return Text(
                    '-',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
              const SizedBox(width: 32.0),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                localizations.location,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              FutureBuilder(
                future: Ipify.geo('at_0HHI70e5EGIYyTm6t3D3zEImyXDKz'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final location = snapshot.data!.location!;
                    return Text(
                      '${location.country}, ${location.region}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }
                  return Text(
                    '-',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
              const SizedBox(width: 32.0),
            ],
          ),
        ],
      ),
    );
  }
}
