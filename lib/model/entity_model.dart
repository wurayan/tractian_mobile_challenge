
class EntityModel {
  String id;
  String name;
  String? parentId;
  List<EntityModel> children;
  bool expanded;

  EntityModel(
      {required this.id,
      required this.name,
      this.parentId,
      List<EntityModel>? children,
      this.expanded = false})
      : children = children ?? [];

  bool get hasChildren => children.isNotEmpty;

  void addChild(EntityModel item) => children.add(item);

  EntityModel filteredClone(List<EntityModel> newChildren) =>
      EntityModel(id: id, name: name, children: newChildren);
}
