import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  final baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProducts() async {
    final url = '$baseUrl/products';
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
