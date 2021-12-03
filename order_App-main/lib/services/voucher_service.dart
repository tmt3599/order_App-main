import 'dart:convert';

import 'package:order_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/config/ApiConfig.dart';

class VoucherService {
  Future<List<Home>> getVoucher() async {
    final url = Uri.https(ApiConfig.baseApi, 'voucher2');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Homes.fromJsonList(decodedData['data']);
    return peliculas.items;
  }
}
