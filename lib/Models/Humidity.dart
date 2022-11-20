const String tableDataHumidity = 'Humidity';

///Class containing all the attributes or fields of the Humidity table.
class DataFieldsHumidity {
  static final List<String> values = [id, name, value];
  static const String id = 'id';
  static const String name = 'name';
  static const String value = 'value';
}

///Humidity model with the attributes, in charge of converting and returning the information from the categories table in json format.
class Humidity {
  int? id;
  String name;
  String value;

  Humidity({required this.id, required this.name, required this.value});

  Humidity copy({
    int? id,
    String? name,
    String? description,
  }) =>
      Humidity(
        id: id ?? this.id,
        name: name ?? this.name,
        value: description ?? value,
      );

  static Humidity fromJson(Map<String, Object?> json) => Humidity(
        id: json["id"] as int,
        name: json["name"] as String,
        value: json["value"] as String,
      );

  Map<String, Object?> toJson() => {
        DataFieldsHumidity.id: id,
        DataFieldsHumidity.name: name,
        DataFieldsHumidity.value: value,
      };
}
