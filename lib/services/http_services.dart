import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class HttpServices {
  Future<List<ResponseModel>?> getCities() async {
    final url =
        Uri.parse('https://61d6901a35f71e0017c2e6c9.mockapi.io/api/v1/cities');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final extractedData = json.decode(utf8.decode(response.bodyBytes));

        List<ResponseModel> res = (extractedData as List)
            .map((data) => ResponseModel.fromJson(data))
            .toList();

        // ResponseModel responseModel = ResponseModel.fromJson(extractedData);

        return res;
      } else {
        throw Exception('hata');
      }
    } catch (e) {
      e.toString();
      return null;
    }
  }
}
