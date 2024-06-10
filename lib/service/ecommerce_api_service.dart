import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mami_onesignal_flutter/service/ecommerce_api_model.dart';

class EcommerceApiService {
  final String baseUrl = "https://fake-store-api.mock.beeceptor.com";

  Future<List<EcommerceApimodel>> fetchProducts() async {
    var response = await http.get(Uri.parse("$baseUrl/api/products"));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body) as List;
      List<EcommerceApimodel> productList = [];

      for (var productJson in responseJson) {
        EcommerceApimodel product = EcommerceApimodel.fromJson(productJson);
        productList.add(product);
      }

      if (productList.isNotEmpty) {
        debugPrint(productList.toString());
        return productList;
      } else {
        throw Exception('Empty product list');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
