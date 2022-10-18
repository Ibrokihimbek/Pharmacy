import 'package:json_annotation/json_annotation.dart';

class DrugsModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  num? price;
  num? quantity;

  DrugsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory DrugsModel.fromjson(Map<String, dynamic> jsonData) {
    int id = jsonData['id'] ?? 0;
    String name = jsonData['name'] ?? '';
    String description = jsonData['description'] ?? '';
    String imageUrl = jsonData['imageUrl'] ?? '';
    num price = jsonData['price'] ?? 0;
    num quantity = jsonData['quantity'] ?? 0;

    return DrugsModel(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}
