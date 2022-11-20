
import 'package:json_annotation/json_annotation.dart';

part 'ListitemSectionModel.g.dart';
//need this class to render list options
///run this command
///flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ListSectionModel {
  const ListSectionModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.route,
  });

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String route;

  @JsonKey(defaultValue: '')
  final dynamic icon;


  ListSectionModel copyWith({
    String? title,
    String? description,
    String? icon,
    String? route,
  }) {
    return ListSectionModel(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      route: route ?? this.route,

    );
  }

}
