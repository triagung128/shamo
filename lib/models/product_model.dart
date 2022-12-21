import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final String? tags;
  final CategoryModel? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
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
        'category': category?.toJson(),
        'created_at': createdAt.toString(),
        'updated_at': createdAt.toString(),
        'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      };
}

class UninitializedProductModel extends ProductModel {}
