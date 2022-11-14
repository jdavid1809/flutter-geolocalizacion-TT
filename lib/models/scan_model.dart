// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    required this.hora,
    required this.latitud,
    required this.longitud,
  });

  int? id;
  String hora;
  String latitud;
  String longitud;

  LatLng getLatLng() {
    final lat = double.parse(latitud);
    final lng = double.parse(longitud);

    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        hora: json["hora"],
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hora": hora,
        "latitud": latitud,
        "longitud": longitud,
      };
}
