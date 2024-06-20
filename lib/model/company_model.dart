class CompanyModel {
  String id;
  String name;
  List? children;

  CompanyModel({required this.id, required this.name, this.children});

  @override
  String toString() => "\nID: $id \n Name:$name";

  factory CompanyModel.fromMap(Map<String, dynamic> map) => switch (map) {
        {
          "id": String id,
          "name": String name,
        } =>
          CompanyModel(id: id, name: name),
        _ => throw const FormatException("Failed to load Company"),
      };
}
