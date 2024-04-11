import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final int id;
  final String name;
  final bool isDeleted;
  final String imageUrl;

  BrandModel(
      {required this.id,
      required this.name,
      this.isDeleted = false,
      required this.imageUrl});

  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isDeleted': isDeleted,
      'imageUrl': imageUrl,
    };
  }

  // Factory constructor to create Category object from JSON
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
