import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class Service {
  String apiKey = 'de17e0f00c9f40cc85b339998d6dbb40';
  // String apiKey = 'cab817200f92426bacb4edd2373e82ef';
  String baseUrl = 'https://newsapi.org/v2/';

  Future getNewsUS() async {
    Uri url = Uri.parse('${baseUrl}top-headlines?country=us&apikey=$apiKey');
    
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['articles'].map((json) => NewsModel.fromJson(json)).toList();
    } 
  }

  Future getNewsSearch(String query) async {
    Uri url = Uri.parse('${baseUrl}everything?q=$query&apiKey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['articles'].map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed Load News Search');
    }
  }
}
