
import 'package:json_annotation/json_annotation.dart';
import 'image.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  final String name;
  final String description;
  final double latitute;
  final double longitute;
  final Image image;

  City(this.id, this.name, this.description, this.latitute, this.longitute, this.image);

  factory City.fromJson(Map<String, dynamic> json) 
    =>  _$CityFromJson(json);

}