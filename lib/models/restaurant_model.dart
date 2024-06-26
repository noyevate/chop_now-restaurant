// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    final String title;
    final String userId;
    final String time;
    final String imageUrl;
    final String owner;
    final String code;
    final String logoUrl;
    final Coords coords;

    RestaurantModel({
        required this.title,
        required this.userId,
        required this.time,
        required this.imageUrl,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.coords,
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        title: json["title"],
        userId: json["userId"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        coords: Coords.fromJson(json["coords"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "userId": userId,
        "time": time,
        "imageUrl": imageUrl,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "coords": coords.toJson(),
    };
}

class Coords {
    final String id;
    final double latitude;
    final double longitude;
    final String address;
    final String title;

    Coords({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.address,
        required this.title,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
    };
}
