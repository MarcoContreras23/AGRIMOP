
const String tableDataFertilizers = 'Fertilizers';

///Class containing all the attributes or fields of the categories table.
class DataFieldsFertilizers {
  static final List<String> values = [id, name, value];
  static const String id = 'id';
  static const String name = 'name';
  static const String value = 'value';
}

///Fertilizer model with the attributes, in charge of converting and returning the information from the categories table in json format.
class Fertilizer {
  int? id;
  String name;
  String value;

  Fertilizer({required this.id, required this.name, required this.value});

  Fertilizer copy({
    int? id,
    String? name,
    String? description,
  }) =>
      Fertilizer(
        id: id ?? this.id,
        name: name ?? this.name,
        value: description ?? value,
      );

  static Fertilizer fromJson(Map<String, Object?> json) => Fertilizer(
        id: json["id"] as int,
        name: json["name"] as String,
        value: json["value"] as String,
      );

  Map<String, Object?> toJson() => {
        DataFieldsFertilizers.id: id,
        DataFieldsFertilizers.name: name,
        DataFieldsFertilizers.value: value,
      };
}
