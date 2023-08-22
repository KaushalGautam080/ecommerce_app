import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../modal/product_modal.dart';

class ApiServices {
  Future<ProductModal>? getCategory(String category) async {
    try {
      var url = "https://dummyjson.com/products/category/$category";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        log("Body $body");
        return ProductModal.fromJson(body);
      } else {
        throw Exception(
            "API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      log("Api error: $e");
      rethrow;
    }
  }
}
