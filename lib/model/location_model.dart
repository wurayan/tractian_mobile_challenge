import 'package:tractian_challenge_treeview/model/entity_model.dart';

class LocationModel extends EntityModel {
  LocationModel({
    required super.id,
    required super.name,
    super.parentId,
    super.children,
    super.expanded,
  });

  @override
  String toString() => "\nID: $id \n Name: $name \n Parent: $parentId\n";

  factory LocationModel.fromMap(Map<String, dynamic> map) => switch (map) {
        {
          "id": String id,
          "name": String name,
          "parentId": String? parentId,
        } =>
          LocationModel(id: id, name: name, parentId: parentId),
        _ => throw const FormatException("Failed to load Location"),
      };

  bool get isRootLocation => parentId == null;

  @override
  LocationModel filteredClone(List<EntityModel> newChildren) => LocationModel(
        id: id,
        name: name,
        parentId: parentId,
        children: newChildren,
        expanded: true,
      );
}
