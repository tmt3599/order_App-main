import 'dart:convert';
import 'package:order_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/config/ApiConfig.dart';

class ProductService {
  Future<List<Product>> getProduct() async {
    final url = Uri.https(ApiConfig.baseApi, 'product');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Products.fromJsonList(decodedData['data']);
    return peliculas.items;
  }
}

class ProductSearch {
  static Future<List<Product>> getProductSearch(String query) async {
    final url = Uri.https(ApiConfig.baseApi, 'product');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final peliculas = Products.fromJsonList(decodedData['data']);

      return peliculas.items.where((product) {
        
      final titleLower = product.name.toString().toLowerCase();
      final authorLower = product.price.toString().toLowerCase();
      final searchLower = query.toLowerCase();

         return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}