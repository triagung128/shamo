import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final String? tags;
  final CategoryModel category;
  final DateTime createdAt;
  final DateTime updatedAt;
  List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        tags: json['tags'],
        category: CategoryModel.fromJson(json['category']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        galleries: List<GalleryModel>.from(
          json['galleries'].map((gallery) => GalleryModel.fromJson(gallery)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'tags': tags,
        'category': category.toJson(),
        'created_at': createdAt.toString(),
        'updated_at': createdAt.toString(),
        'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      };
}
