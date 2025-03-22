import 'package:flutter/material.dart';
import 'package:volumeter/core/extensions/context_extension.dart';

class AdaptiveText extends StatelessWidget {
  const AdaptiveText({
    super.key,
    required this.english,
    required this.romanian,
  });
  final String english;
  final String romanian;

  @override
  Widget build(BuildContext context) {
    if (context.localizations.localeName == 'ro') {
      return Text(romanian);
    }
    return Text(english);
  }
}
