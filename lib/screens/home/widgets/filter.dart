import 'package:flutter/material.dart';
import 'package:starter/models/sort_type.dart';

class SortItem {
  final SortType type;
  final String text;

  SortItem({this.type, this.text});
}

final _filters = <SortItem>[
  SortItem(type: SortType.oldToNew, text: "Cũ đến mới"),
  SortItem(type: SortType.newToOld, text: "Mới đến cũ"),
  SortItem(type: SortType.ascending, text: "Tăng dần"),
  SortItem(type: SortType.descending, text: "Giảm dần"),
];

class Sort extends StatelessWidget {
  final Function(SortType) onSelected;

  const Sort({@required this.onSelected});

  PopupMenuItem<SortType> _buildSortItem(SortItem filter) {
    return PopupMenuItem(
      value: filter.type,
      child: Text(filter.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortType>(
      icon: Icon(Icons.filter_list),
      itemBuilder: (context) => _filters.map(_buildSortItem).toList(),
      onSelected: onSelected,
    );
  }
}
