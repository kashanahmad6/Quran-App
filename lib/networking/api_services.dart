import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quran_app/model/quran_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Quran>> getData() async {
    final respone = await http.get(
      Uri.parse('https://api.alquran.cloud/v1/quran/quran-uthmani'),
    );
    if (respone.statusCode == 200) {
      final body = jsonDecode(respone.body);

      final response = body["data"]["surahs"] as List;

      final surahsList = response.map((e) => Quran.fromJsom(e)).toList();

      return surahsList;
    } else {
      if (kDebugMode) {
        print('Error--------------> ');
      }
    }

    return [];
  }
}
