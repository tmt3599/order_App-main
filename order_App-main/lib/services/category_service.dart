import 'dart:convert';

import 'package:order_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/config/ApiConfig.dart';

class CategoryService {
  Future<List<Category>> getCategory() async {
    final url = Uri.https(ApiConfig.baseApi, 'category');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Categoris.fromJsonList(decodedData['data']);
    return peliculas.items;
  }
}