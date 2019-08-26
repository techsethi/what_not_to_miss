// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodJoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodJoint _$FoodJointFromJson(Map<String, dynamic> json) {
  return FoodJoint(
    json['name'] as String,
    json['location'] as String,
    json['description'] as String,
    (json['latitute'] as num)?.toDouble(),
    (json['longitute'] as num)?.toDouble(),
    json['active'] as int,
    json['main_image'] == null
        ? null
        : Image.fromJson(json['main_image'] as Map<String, dynamic>),
    json['thumbnail'] == null
        ? null
        : Image.fromJson(json['thumbnail'] as Map<String, dynamic>),
    json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

// Map<String, dynamic> _$FoodJointToJson(FoodJoint instance) => <String, dynamic>{
//       'name': instance.name,
//       'location': instance.location,
//       'description': instance.description,
//       'latitute': instance.latitute,
//       'longitute': instance.longitute,
//       'active': instance.active,
//       'city': instance.city,
//       'main_image': instance.main_image,
//       'thumbnail': instance.thumbnail,
//     };
