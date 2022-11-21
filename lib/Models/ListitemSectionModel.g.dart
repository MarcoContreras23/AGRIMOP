// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListitemSectionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSectionModel _$ListSectionModelFromJson(Map<String, dynamic> json) =>
    ListSectionModel(
      icon: json['icon'] ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      route: json['route'] as String? ?? '',
    );

Map<String, dynamic> _$ListSectionModelToJson(ListSectionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'route': instance.route,
      'icon': instance.icon,
    };
