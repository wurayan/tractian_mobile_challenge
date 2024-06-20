import 'package:tractian_challenge_treeview/model/entity_model.dart';

class AssetModel extends EntityModel {
  String? locationId;
  String? sensorId;
  String? sensorType;
  String? status;

  AssetModel({
    required super.id,
    required super.name,
    super.parentId,
    this.locationId,
    this.sensorId,
    this.sensorType,
    this.status,
    super.children,
    super.expanded,
  });

  @override
  String toString() =>
      "\nID: $id \n Name: $name \n Parent: $parentId \n Status: $status\n";

  factory AssetModel.fromMap(Map<String, dynamic> map) => AssetModel(
        id: map["id"],
        name: map["name"],
        parentId: map["parentId"],
        locationId: map["locationId"],
        sensorId: map["sensorId"],
        sensorType: map["sensorType"],
        status: map["status"],
      );

  @override
  AssetModel filteredClone(List<EntityModel> newChildren) => AssetModel(
      id: id,
      name: name,
      locationId: locationId,
      parentId: locationId,
      sensorId: sensorId,
      sensorType: sensorType,
      status: status,
      children: newChildren,
      expanded: true);

  bool get isComponent => sensorType != null;
  bool get isRootComponent =>
      isComponent && parentId == null && locationId == null;
  bool get isCritic => status == "alert";
  bool get isEnergy => sensorType == "energy";
  bool get hasNoParents => parentId == null && locationId == null;
}
