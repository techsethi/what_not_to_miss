import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:what_not_to_miss/types/city.dart';
import 'package:what_not_to_miss/types/image.dart';
import 'package:what_not_to_miss/constants.dart';

part 'foodJoint.g.dart';

@JsonSerializable()
class FoodJoint {
  final String name;
  final String location;
  final String description;
  final double latitute;
  final double longitute;
  final int active;
  final City city;
  final Image main_image;
  final Image thumbnail;

  FoodJoint(this.name, this.location, this.description, this.latitute, this.longitute, this.active, this.main_image, this.thumbnail, this.city);

  factory FoodJoint.fromJson(Map<String, dynamic> json) 
    =>  _$FoodJointFromJson(json);

  static Future <List <FoodJoint>> browse(cityname) async {

    // http.Response response = await http.get('$APP_HOST/foodjoints?city.name_contains=$cityname');

    http.Response response = await http.get('$APP_HOST/foodjoints?city.name_contains=$cityname');


    // await Future.delayed(Duration(seconds: 3));
    
    String content = response.body;
    List collection = json.decode(content);
    List <FoodJoint> _foodJoints = collection.map((json) => FoodJoint.fromJson(json)).toList() ;

    return _foodJoints;

  }

}