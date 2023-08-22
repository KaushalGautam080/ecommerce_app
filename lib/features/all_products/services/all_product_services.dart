import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../modal/all_product_modal.dart';

class AllProductServices {
  Future<AllProductModal> getAllProducts() async {
    try {
      var url = "https://dummyjson.com/products";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        // log("AllProducts : $body");
        return AllProductModal.fromJson(body);
      } else {
        throw "Api response failed with status code ${response.statusCode} : ${response.body}";
      }
    } catch (e) {
      log("Api error: $e");
      rethrow;
    }
  }
}
