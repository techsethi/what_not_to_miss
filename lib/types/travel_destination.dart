import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TravelDestination {
  const TravelDestination({
    @required this.assetName,
    @required this.title,
    @required this.city,
  }) : assert(assetName != null),
       assert(title != null),
       assert(city != null);

  final String assetName;
  final String title;
  final String city;
}

const List<TravelDestination> destinations = <TravelDestination>[
  TravelDestination(
    assetName: 'images/places/delhi-city.jpg',
    title: 'Food Capital of India',
    city: 'Delhi',
  ),
  TravelDestination(
    assetName: 'images/places/amritsar-city.jpg',
    title: 'The Golden Temple',
    city: 'Amritsar',
  ),
  TravelDestination(
    assetName: 'images/places/goa-city.jpg',
    title: 'The Tropical Paradise',
    city: 'Goa',
  ),
  TravelDestination(
    assetName: 'images/places/gurgaon-city.jpg',
    title: 'Cyber City of Haryana',
    city: 'Gurgaon',
  ),
  TravelDestination(
    assetName: 'images/places/chandigarh-city.jpg',
    title: 'The Famous Rock Garden',
    city: 'Chandigarh',
  ),
  TravelDestination(
    assetName: 'images/places/agra-city.jpg',
    title: 'The Iconic Taj Mahal',
    city: 'Agra',
  ),
  TravelDestination(
    assetName: 'images/places/varanasi-city.jpg',
    title: 'The Immortal City',
    city: 'Varanasi',
  ),
  TravelDestination(
    assetName: 'images/places/dubai-city.jpg',
    title: 'Endless Shopping',
    city: 'Dubai',
  ),
  TravelDestination(
    assetName: 'images/places/shimla-city.jpg',
    title: 'The Queen of Hills',
    city: 'Shimla',
  ),
  TravelDestination(
    assetName: 'images/places/dehradun-city.jpg',
    title: 'The Gateway to Mussorie',
    city: 'Dehradun',
  ),
  TravelDestination(
    assetName: 'images/places/shirdi-city.jpg',
    title: 'Jai Sai Ram',
    city: 'Shirdi',
  ),
  TravelDestination(
    assetName: 'images/places/jaipur-city.jpg',
    title: 'The Pink City',
    city: 'jaipur',
  ),
];