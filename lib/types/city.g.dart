// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['latitute'] as num)?.toDouble(),
    (json['longitute'] as num)?.toDouble(),
    json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

// Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'description': instance.description,
//       'latitute': instance.latitute,
//       'longitute': instance.longitute,
//       'image': instance.image,
//     };
