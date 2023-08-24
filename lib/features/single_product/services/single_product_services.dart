import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../modal/single_product_modal.dart';

class SingleProductServices {
  Future<SingleProductModal>? getSingleProduct(String id) async {
    try {
      var url = "https://dummyjson.com/products/$id";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return SingleProductModal.fromJson(body);
      } else {
        throw Exception(
            "Api failed request with status code${response.statusCode}:${response.body}");
      }
    } catch (e) {
      log("Api Error : $e");
      rethrow;
    }
  }
}
