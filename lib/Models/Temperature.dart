const String tableDataTemperature = 'Temperature';

///Class containing all the attributes or fields of the Temperature table.
class DataFieldsTemperature {
  static final List<String> values = [id, name, value];
  static const String id = 'id';
  static const String name = 'name';
  static const String value = 'value';
}

///Temperature model with the attributes, in charge of converting and returning the information from the categories table in json format.
class Temperature {
  int? id;
  String name;
  String value;

  Temperature({required this.id, required this.name, required this.value});

  Temperature copy({
    int? id,
    String? name,
    String? description,
  }) =>
      Temperature(
        id: id ?? this.id,
        name: name ?? this.name,
        value: description ?? value,
      );

  static Temperature fromJson(Map<String, Object?> json) => Temperature(
        id: json["id"] as int,
        name: json["name"] as String,
        value: json["value"] as String,
      );

  Map<String, Object?> toJson() => {
        DataFieldsTemperature.id: id,
        DataFieldsTemperature.name: name,
        DataFieldsTemperature.value: value,
      };
}