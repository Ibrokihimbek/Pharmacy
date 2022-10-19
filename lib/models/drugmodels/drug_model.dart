import 'package:json_annotation/json_annotation.dart';

// part 'drug_model.g.dart';

// @JsonSerializable()
class DrugsModel {
  // @JsonKey(name: 'id', defaultValue: '')
  int? id;

  // @JsonKey(name: 'name', defaultValue: '')
  String? name;

  // @JsonKey(name: 'description', defaultValue: '')
  String? description;

  // @JsonKey(name: 'imageUrl', defaultValue: '')
  String? imageUrl;

  // @JsonKey(name: 'price', defaultValue: 0)
  num? price;

  // @JsonKey(name: 'quantity', defaultValue: 0)
  num? quantity;

  DrugsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  // factory DrugsModel.fromJson(Map<String, dynamic> json) =>
  //     _$DrugsModelFromJson(json);

  // Map<String, dynamic> toJson() => _$DrugsModelToJson(this);

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
