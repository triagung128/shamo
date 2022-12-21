import 'package:shamo/models/product_model.dart';

class MessageModel {
  final String message;
  final int userId;
  final String userName;
  final String userImage;
  final bool isFromUser;
  final ProductModel product;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        product: json['product'].isEmpty
            ? UninitializedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'userId': userId,
        'userName': userName,
        'userImage': userImage,
        'isFromUser': isFromUser,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
      };
}
