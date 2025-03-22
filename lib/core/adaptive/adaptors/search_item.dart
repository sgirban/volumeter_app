import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:volumeter/core/routes/router.dart';

class SearchItem {
  const SearchItem({required this.label, required this.path});
  final String label;
  final String path;

  fluent.AutoSuggestBoxItem<String> toAutoSuggestBoxItem(
    fluent.TextEditingController searchController,
    fluent.FocusNode searchFocusNode,
  ) {
    return fluent.AutoSuggestBoxItem<String>(
      value: label,
      label: label,
      onSelected: () {
        router.push(path);
        searchController.clear();
        searchFocusNode.unfocus();
      },
    );
  }

  ListTile toListTile(SearchController controller) {
    return ListTile(
      title: Text(label),
      onTap: () {
        router.push(path);
        controller.clear();
        controller.closeView(null);
      },
    );
  }
}
