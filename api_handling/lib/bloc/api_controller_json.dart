//Step 4
import 'dart:convert';

import 'package:http/http.dart';
import 'Post.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiControllerJson {
  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200) {
// If server returns an OK response, parse the JSON.
      var data = json.decode(response.body);
      var rest = data as List;
      List<Post> list = rest.map((json) => Post.fromJson(json)).toList();
      return list;
    } else {
// If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
