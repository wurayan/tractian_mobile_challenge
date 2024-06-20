import 'package:flutter/widgets.dart';
import 'package:tractian_challenge_treeview/model/asset_model.dart';
import 'package:tractian_challenge_treeview/model/entity_model.dart';
import 'package:tractian_challenge_treeview/model/location_model.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/treeview_item.dart';

class TreeViewWidget extends StatelessWidget {
  final List<EntityModel> itens;
  final int level;
  const TreeViewWidget({super.key, required this.itens, this.level = 0});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itens.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        EntityModel item = itens[index];
        return TreeViewItem(
          item: item,
          iconPath: getIcon(item),
          level: level,
        );
      },
    );
  }
}

String? getIcon(EntityModel item) {
  if (item is LocationModel) {
    return "assets/icons/location.png";
  } else if (item is AssetModel) {
    return item.isComponent
        ? "assets/icons/component.png"
        : "assets/icons/asset.png";
  }
  return null;
}
