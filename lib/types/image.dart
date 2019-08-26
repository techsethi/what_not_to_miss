
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final int id;
  final String name;
  final String url;
  final String size;

  Image(this.id, this.name, this.url, this.size);

  factory Image.fromJson(Map<String, dynamic> json) 
    =>  _$ImageFromJson(json);

}