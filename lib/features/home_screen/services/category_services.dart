import 'dart:convert';

import 'package:http/http.dart' as http;

List category = [];

Future<List<String>> getCategory() async {
  try {
    var url = "https://dummyjson.com/products/categories";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      // log(json.toString());
      return List<String>.from(json);
    } else {
      throw "Api response failed with${response.statusCode} with ${response.body}";
    }
  } catch (e) {
    throw ("Error: $e");
  }
}

// class CategoryService {
//
// }
